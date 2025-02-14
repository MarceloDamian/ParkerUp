


import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/pages/Circular_Seek_Bar_Example_Page.dart';
import 'package:flutter_application_1/pages/settings_page.dart';
import 'package:flutter_application_1/pages/specs.dart';
import 'package:geocode/geocode.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:searchfield/searchfield.dart';

import 'package:circular_seek_bar/circular_seek_bar.dart';



// https://stackoverflow.com/questions/71258134/how-can-i-place-a-container-laid-out-above-a-scaffold






class CustomAppBar extends StatelessWidget implements PreferredSizeWidget
{
  final double height;
  final Widget topChild;
  final AppBar appBar;
  

  const CustomAppBar
  (
    {
      super.key,
      this.height=105.0,
      required this.topChild,
      required this.appBar,

    }
  );

  @override

  Widget build(BuildContext context)
  {
    return Column
    (
      children: [
     
        appBar,
        Expanded(child:topChild),
      ]
    );
  }
  @override 
  Size get preferredSize => Size.fromHeight(height);

}





class gmaps extends StatefulWidget
{

  const gmaps({super.key});
  @override
  State<gmaps> createState() => _gmapsState();

}

// ignore: camel_case_types
class _gmapsState extends State<gmaps>
{  
  
  // geocoding is address to LatLng
  // reverse geocoding is LatLng to address
  // 
  
    
  late GoogleMapController mapController;
  double rating = 0.0;
  String query = '';
  LatLng longandlat =  const LatLng (0,0);
  
  // LatLng longandlat =  const LatLng (40.68658779998126, -73.91463750377459); // decimal points matter when looking at location.


  // final LatLng _center =  const LatLng (40.68658779998126, -73.91463750377459); // decimal points matter when looking at location.
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  



  void _onMapCreated (GoogleMapController controller)
  {
    mapController = controller;
    
  }
  

  Future<LatLng> stringquery(String addy) async 
  {

    GeoCode geoCode = GeoCode();

    try
    {


      // bottom might not matter as address might not show because of api cost.. 
      //also you might be able to change the country through the api manager in google maps.
      
      // ----------------------------------------------------------------------------------------
      
      // Search the string for street, Street or st or any other variations (ave, avenue, (uooercase variations))
      // and then store the word before that as well as Street and match that with streetAddress.
      
      // final splitintoarray = addy.split(' ');
      // print(splitintoarray[1]); // [Halsey];
      // print(splitintoarray[2]); // [Street]; //  Next steps would be to match this with street address

      // const spaceinbtwn = " ";
      // var fulladdress = splitintoarray[1]  + spaceinbtwn + splitintoarray[2];

      // // There is an error in which when you are typing out the address you have to add a space 
      // // at the end for it to fully store into the arrays. 

      // print("addy ${splitintoarray}"); // check all uppercase cases
      // print(" Final Address:  ${fulladdress}    ");

      // Street Address: Main Street or it could be drive or avenue but ths is usually index 2 
      // if (addy_.streetAddress == fulladdress)
      // {
      //   print("Success this is the address. ");
      //   longandlat = LatLng(coordinates.latitude!,coordinates.longitude!); // "!" is a null check

      //   print ("Latitude: ${coordinates.latitude}");
      //   print ("Longitude: ${coordinates.longitude}");
      // }

      // ----------------------------------------------------------------------------------------

      Coordinates coordinates;

      coordinates = await geoCode.forwardGeocoding
      (
        address: addy,
      );

      Address addy_;

      addy_ = await geoCode.reverseGeocoding
      (
        latitude: coordinates.latitude!, 
        longitude: coordinates.longitude!, 

      );

      longandlat = LatLng(coordinates.latitude!,coordinates.longitude!); // "!" is a null check


      print
      (
        "Reverse Geocoding: \n Country Code: ${addy_.countryCode}\n Country Name: ${addy_.countryName}\n Region: ${addy_.region}\n  City: ${addy_.city}\n Street Address: ${addy_.streetAddress}\n"
        // "Reverse Geocoding: ${addy_}"
      );

      // =========== Alternative for GeoCode (limited places) ================================================
      // List<Location> locations = await locationFromAddress(addy);
      // List<Placemark> placemarks = await placemarkFromCoordinates(coordinates.latitude!,coordinates.longitude!);
      // print ("locations:     ${locations}");
      // print ("placemarks:     ${placemarks}");
      // ===========================================================

      // addy is the address in a string format written as "number and street, city, state, zip code"
      
      // if (addy_.countryName=="United States of America" && addy_.countryCode=="US") // cameraTargetBounds does a better job than this
      // {
        // longandlat = LatLng(coordinates.latitude!,coordinates.longitude!); // "!" is a null check
      // }

      // Center OF NYC  lat: 40.7128, lng: -74.0060
      // SW corner of nyc LatLng(40.7128,-74.0060)
      // NE corner of nyc LatLng(40.79, -73.9667)

      print ("Latitude: ${coordinates.latitude}");
      print ("Longitude: ${coordinates.longitude}");
      
    }
    catch(e)
    {
      print(e);
    }

    
    return longandlat;
    // this in the future should return the last current location not the ocean but its a good step.


  }

  // final ValueNotifier<CameraPosition> currentCameraPosition = ValueNotifier(CameraPosition(target: LatLng (40.68658779998126, -73.91463750377459), zoom: 18.0));

  
  // LatLng promised =  const LatLng (0,0);
  // void newtarget(String newQuery)
  // {
  //   setState(()
  //     {
  //       query = newQuery;
  //       stringquery(query); 
  //       // stringquery(query).then((result){promised=result;});
  //     }
  //   );
  // }

  LatLng promised = const LatLng (0,0);

  // ValueNotifier<CameraPosition> currentCameraPosition = ValueNotifier(CameraPosition(target:LatLng(0,0), zoom: 18.0));
  final LocationSettings locationSettings_ = const LocationSettings
  (
    accuracy:LocationAccuracy.high,
    distanceFilter:100,
  );
  // Position position = Geolocator.getCurrentPosition(locationSettings: locationSettings_);
  
  
  
  
  // OverlayEntry? _overlayEntry;
  
  final GlobalKey _generateImageKey = GlobalKey(); // ! NEW IMPLEMENTED CODE
  


  UniqueKey uniqueSearch = UniqueKey(); // ! NEW IMPLEMENTED CODE
  UniqueKey uniqueLoading = UniqueKey(); // ! NEW IMPLEMENTED CODE 

  // -----------------^^^ probably use this to change everything. 


  OverlayEntry? _overlayEntry;  // ! NEW IMPLEMENTED CODE
  String? _selectedCountry;
  
  


  
  String value = "";

  int amtofcars = 0;




  @override
  
  Widget build(BuildContext context) 
  {

    return Container
    (
      child: MaterialApp
      (  
        home:Scaffold
        (
          appBar:CustomAppBar
          (
            

            topChild:SizedBox
            (
              height: 90, 

              child: TextField
              (              
                style:const TextStyle(color:Color.fromARGB(255, 255, 255, 255)),

                onChanged:(String newQuery) async
                {
                  GoogleMapController controller_ = mapController;

                  setState(()
                  {
                    stringquery(query).then
                    (
                      (result)
                      {
                        promised=result;     
                        
                        controller_.animateCamera
                        (
                          CameraUpdate.newCameraPosition
                          (
                            CameraPosition
                            (
                              target:promised,
                              // zoom:18.5,
                              zoom:14.5,

                            ),
                          ),
                        );

                        
                      },
                    );
                    query = newQuery;
                    stringquery(query); 
                    // stringquery(query).then((result){promised=result;});
                  });

                },
                decoration: const InputDecoration
                (
                  filled:true,
                  fillColor:Color.fromRGBO(0, 0, 0, 0.8),
                  labelText: 'Search Location',
                  labelStyle:TextStyle
                  (  
                    color:Color.fromARGB(255, 51, 208, 216),
                    letterSpacing:1
                  ),
                  border:  OutlineInputBorder(),
                  prefixIcon:  Icon
                  (
                    Icons.search,
                    color:Color.fromARGB(255, 51, 208, 216),
                  ),
                  
                ),
              ),      
            ),            
            
            appBar:AppBar
            (

              key: _generateImageKey,

              toolbarHeight: 50,
              backgroundColor:const Color.fromARGB(255, 119, 117, 117),

              flexibleSpace:Row
              (
                children: <Widget>
                [
                  GestureDetector
                  (
                    child:const Padding
                    (
                      padding:EdgeInsets.only
                      (
                        left : 30.0,
                        top : 50.0,
                        right : 0.0,
                        bottom : 0.0,                
                      ), 

                    // UNCOMMENT THIS BELOW!!!!!!!!!!

                      child: Icon
                      (
                        Icons.car_rental, // Change this to a custom car dart icon
                        size:48,
                        color:Color.fromARGB(255, 196, 216, 231),
                      ),
                      
                    // UNCOMMENT UP TO HERE.


                      // child: PopupMenuButton<int>
                      // (  
                      //   // color:Color.fromARGB(92, 94, 194, 237),
                      //   color:Color.fromARGB(186, 49, 145, 186),


                      //   child: const Icon
                      //   (
                      //     Icons.car_rental, // Change this to a custom car dart icon
                      //     size:48,
                      //     color:Color.fromARGB(255, 196, 216, 231),
                      //   ),
                      //   onSelected:(value)
                      //   {
                      //     if(value==0)
                      //     {
                      //       _showSnackbar(context, "CAR 1 Selected");
                      //     }
                      //     else if (value==1)
                      //     {
                      //       _showSnackbar(context, "CAR 2 Selected");
                      //     }
                      //   },
                      //   itemBuilder:(BuildContext context)
                      //   {

                      //     return <PopupMenuItem<int>>
                      //     [ 
                      //       const PopupMenuItem <int>
                      //       (
                      //         padding:const EdgeInsets.only
                      //         (
                      //           left : 30.0,
                      //           top : 20.0,
                      //           right : 0.0,
                      //           bottom : 20.0,                
                      //         ),
                      //         value:0,
                      //         child:Text("CAR 1"),
                      //       ),
                      //       const PopupMenuItem <int>
                      //       (
                      //         padding:const EdgeInsets.only
                      //         (
                      //           left : 30.0,
                      //           top : 20.0,
                      //           right : 0.0,
                      //           bottom : 20.0,                
                      //         ),  
                      //         value:1,
                      //         child:Text("CAR 2"),
                      //       ),
                      //     ];
                      //   },
                      // ),
                    ),
                    // IF CODE BELOW IS LESS THAN 1 THEN BELOW. IF CODE IS ABOVE 1 THEN CODE ABOVE INITIATES. 


                    // ),


                    // UNCOMMENT THIS BELOW!!!!!!!!!!
                    onTap: ()
                    {
                      showOverlay(context);
                    },  
                    // UNCOMMENT THIS ABOVE!!!!!!!!!!


                  ),

                  GestureDetector
                  (
                    child:const Padding
                    (
                      padding:EdgeInsets.only
                      (
                        left : 240.0,
                        top : 50.0,
                        right : 0.0,
                        bottom : 0.0,                
                      ),
                      child: Icon
                      (
                        Icons.menu,
                        size:48,
                        color:Color.fromARGB(255, 196, 216, 231),
                      ),
                  
                    ),
                    onTap: ()
                    {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingsPage()));
                    },  
                  ),
                  
                ],
              ),
            ),
            // topChild: Container(color:Color.fromRGBO(125, 125, 125, 0.5)),

          ),
          
          body:Column
          (
            children:
            [           
              // ElevatedButton// ! NEW IMPLEMENTED CODE
              // (
              //   key: _generateImageKey,
              //   onPressed: () 
              //   { 
              //     showOverlay(context);
              //   }, child: Text('Generate Overlay'),

              // ),  

              Expanded
              (
                flex:4, 
                child:GoogleMap
                (          
                  zoomGesturesEnabled:true,
                  onMapCreated: _onMapCreated,
                  cameraTargetBounds: CameraTargetBounds
                  (
                    LatLngBounds
                    (
                      northeast:const LatLng(40.782418,-73.668671), 
                      southwest:const LatLng(40.62,-74.0074)
                    ),
                  ),
                  initialCameraPosition: const CameraPosition
                  (
                    target: LatLng(40.699574,-73.911942), // ! Why is this neccesary.??
                    tilt:30.0,
                    bearing:10,
                    // target: promised, // create submit button and have that go into target as a promise. 
                    zoom: 11,
                      
                  ),

                

                ),
                
              ),
              
              // Expanded
              // (
              //   child: const Center(child: Text("Dimelo que lo que ")),
              // ),

              // Overlay instead of expanded. 
              // https://www.youtube.com/watch?v=RFyDXOQS59I

            ],
          ),
        // add car search 

          // https://stackoverflow.com/questions/73490833/current-location-on-the-google-maps-flutter
          // https://www.geeksforgeeks.org/how-to-move-camera-to-any-position-in-google-maps-in-flutter
          // https://www.dhiwise.com/post/flutter-search-bar-tutorial-for-building-a-powerful-search-functionality
          // https://pub.dev/packages/geocode
          // https://stackoverflow.com/questions/51283077/when-do-i-use-setstate-in-flutter

        ),
      
      ),
      
    ); 


  }










  void showOverlay(BuildContext context)  // ! NEW IMPLEMENTED CODE
  {

    if (_overlayEntry?.mounted ?? false)
    {
      _overlayEntry?.remove();
      return;
    }


    final RenderBox renderBox = _generateImageKey.currentContext!.findRenderObject() as RenderBox;

    // Size testsize = 100 as Size;
    // Offset testoffset = (100.00,100.00) as Offset;


    _overlayEntry=OverlayEntry
    (
      builder: (context) 
      {
        return CustomPaint
        (
          painter:HighlightPainter
          (
            screenSize: MediaQuery.of(context).size, 

            highlightSize: renderBox.size,

            // testsize,
            // renderBox.size,

            highlightPosition:renderBox.localToGlobal(Offset.zero),
            // testoffset,
            // renderBox.localToGlobal(Offset.zero), 
            highlightRadius: 32,
          ),

          child:Stack
          (
            children:
            [

              Positioned
              (
                

                top: renderBox.localToGlobal(Offset.zero).dy + renderBox.size.height,
                left: renderBox.localToGlobal(Offset.zero).dx + renderBox.size.width-390,

                // top:500,
                // left:500,


                child:SizedBox
                (
                  width:390,
                  height:MediaQuery.of(context).size.height ,

                  // height:MediaQuery.of(context).size.height * 0.15,
                  
                  // color:const Color.fromARGB(255, 255, 255, 255), // ! this code please
                  // height:400,
                  
                  child:Material
                  (
                    color:const Color.fromARGB(0, 0, 0,0 ), //! edit opacity

                    // color:const Color.fromARGB(255, 242, 230, 230),
                    
                      child:Column
                      (

                        children:<Widget>
                        [
                          Container 
                          (
                            margin:const EdgeInsets.symmetric(horizontal:20),
                                // see if there is a way to get rid of this^ visibility and 
                                // if switchtodialog happens to be false too 
                            child:Column 
                            (

                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: 
                              [   
                                Stack
                                (
                                  children: 
                                  [
                                    Align
                                    (
                                      heightFactor:5.9,
                                      child:Column
                                      (
                                        children:
                                        [
                                            // alignment:Alignment.topCenter,                                                

                                            const Text
                                            (
                                              "CAR PROFILE", 
                                              style: TextStyle
                                              (
                                                fontWeight:FontWeight.w500,
                                                fontSize: 30,
                                                fontFamily: 'times new roman',
                                                color:Colors.white,
                                              ),
                                            ),

                                            SearchField
                                            (  
                                              searchInputDecoration:SearchInputDecoration
                                              (
                                                filled:true,

                                                fillColor:const Color.fromRGBO(0, 4, 20, 0.296),
                                            
                                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(50),),
                                            
                                                hintText:"MODEL OR PLATE",

                                                hintStyle:const TextStyle
                                                (  
                                                  fontSize:20.5,
                                                  color:Color(0xFF4684FF),
                                                  letterSpacing:1,
                                                ),
                                                  
                                                          
                                                searchStyle:const TextStyle
                                                (
                                                  color:Color.fromARGB(255, 255, 255, 255), height:1.7, fontSize:21.5,
                                                ),
                                                  
                                                prefixIcon: const Icon
                                                (
                                                  Icons.width_normal_rounded,
                                                  size:30,
                                                  color:Color.fromARGB(255, 70, 132, 255),
                                                ),

                                                contentPadding:const EdgeInsets.fromLTRB(0,30,72,0),

                                              ),
                                              itemHeight: 50,
                                              maxSuggestionsInViewPort:6, 
                                              suggestionsDecoration:SuggestionDecoration
                                              (
                                                color:const Color.fromRGBO(0, 14, 70, 0.323),
                                                borderRadius: BorderRadius.circular(10),

                                              ),
                                              suggestions:
                                              [
                                                "2011 CORVETTE",
                                                "1930 FERRARI",
                                                "2025 HONDA CIVIC TYPE R",
                                                "1969 MUSTANG",
                                              ].map
                                              (SearchFieldListItem<String>.new).toList(),
                                              // onTap: () async 
                                              onSuggestionTap: (SearchFieldListItem<String> x) 
                                              {
                                                setState // set state only once only one tap is responsible to set one tap. 
                                                //multiple states are not allowed to set multiple states.
                                                (()
                                                  {_selectedCountry = x.item;}
                                                );
                                              },

                                              // fix this search algorithm.
                                              suggestionState:Suggestion.expand,
                                            ),
                                        ],
                                      ),
                                    ),

                                    Positioned
                                    (
                                      top:315,
                                      left:280,
                                      child:
                                      
                                      MaterialButton
                                      (
                                        minWidth:70,
                                        height:65,
                                        color:const Color.fromRGBO(0, 14, 70, 0.4),

                                        padding:const EdgeInsets.all(0),
                                        shape: RoundedRectangleBorder
                                        (
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        child:const Icon
                                        (
                                          Icons.arrow_forward_ios, color:Colors.white, size:24,
                                        ),

                                        onPressed:()
                                        {         
                                          // entered is triggered as well. 
                                          // ya tu sabes with entered is triggered. 

                                          ShowLoadingScreen(true);

                                          // trigger a switch 
                                          // Switch deletes button and shows dialog    
                                        // Loading screen // Downloading specs  
                                        },
                                      ),
                                    ),
                                    
                                    // Visibility
                                    // (
                                    //   visible:true,

                                    //   child:Positioned
                                    //   (
                                    //     bottom:100,

                                    //     child:MyButton
                                    //     (
                                    //       onPressed:() 
                                    //       {  
                                    //         print ("true");
                                    //         Navigator.pop(context);
                                    //       }, 
                                    //       text: 'CONTINUE', 
                                    //       hex: const Color.fromARGB(65, 121, 162, 186), 
                                    //       width_: 150, 
                                    //       height_: 75, 
                                    //       circular:BorderRadius.circular(0), 
                                    //     ), 
                                    //   ),

                                    // ),
                                  
                                  
                                  ],
                                  
                                ),

                              ],
                            ),
                          ),
                        ], 
                      ),
                    ),
                      // CircularSeekBarExamplePage(),

                  ),
                  
                ),

            ],
          ),
        );
      },
    );
      Overlay.of(context).insert(_overlayEntry!);
  } 


  void _showSnackbar (BuildContext context, String Message)
  {
    ScaffoldMessenger.of(context).showSnackBar
    (
      SnackBar(content: Text(Message),),
    );
  }


void ShowLoadingScreen(bool switch_) 
  {

    if (_overlayEntry != null && _overlayEntry!.mounted) 
    {
      _overlayEntry!.remove();
      _overlayEntry = null;
      _overlayEntry?.dispose(); // i believe this works now 
    }      

    if(switch_==true)
    {

      amtofcars++;

      showDialog
      (
        context:context,
        useSafeArea:false, 
        builder:(context)
        {
          return CircularSeekBarExamplePage();
          // when text is entered a message is out. 
          // text add flutter pub add random_text_reveal
        },
      );



      Future.delayed(const Duration(seconds:1)).then
      (
        (val)
        {

          showDialog
          (
            context:context,
            useSafeArea:false, 
            builder:(context)
            {
              return Specs_Extended();
              // when text is entered a message is out. 
              // text add flutter pub add random_text_reveal
            },

          );

        }
      );








      
    }
    return;

  }


}



class HighlightPainter extends CustomPainter // ! NEW IMPLEMENTED CODE
{
  final Size screenSize;
  final Size highlightSize;
  final Offset highlightPosition;
  final double highlightRadius;

  HighlightPainter
  ({
    required this.screenSize,
    required this.highlightSize,
    required this.highlightPosition,
    required this.highlightRadius,
  });


  @override

  void paint(Canvas canvas, Size size) // ! NEWLY IMPLEMENTED CODE
  {

    final paint = Paint()..color = Colors.black54;
    canvas.drawPath
    (
      Path.combine
      (
        PathOperation.difference,
        Path()..addRRect
        (
          RRect.fromLTRBR(0, 0, screenSize.width, screenSize.height,Radius.zero),
        ),
        Path()..addRRect
        (
          RRect.fromLTRBR(highlightPosition.dx, highlightPosition.dy,  highlightPosition.dx + highlightSize.width, highlightPosition.dy + highlightSize.height-120 , Radius.circular(highlightRadius),),
        ),
      ), paint
    );
  }

  @override 



  bool shouldRepaint(covariant CustomPainter oldDelegate) // ! NEWLY IMPLEMENTED CODE
  {
    return true;
  }

  @override

  bool? hitTest (Offset position) // ! NEWLY IMPLEMENTED CODE
  {
      return true;
  }

}


// todo: fix plressing searchfield two times and it erroring out. 
// todo: add search suggesstions in google maps 





// --------------------------------------OutDated Code-------------------------------------------------------




// Visibility
// (
//   child:Stack
//   (
//     children: 
//     [
//       Align
//       (
//         alignment:Alignment.topCenter,
//         heightFactor:7,
//         child: Text
//         (
//           "CAR PROFILE", 
//           style: TextStyle
//           (
//             fontWeight:FontWeight.w500,
//             fontSize: 30,
//             fontFamily: 'times new roman',
//             color:Colors.white,
//           ),
//         ),
//       ),
//       // CircularSeekBarExamplePage(), 

//       Align
//       (
//         heightFactor:3,
//         child:Column
//         (
//           children:
//           [
//             SearchField
//             (  
//               searchInputDecoration:SearchInputDecoration
//               (
          
//               filled:true,
//               fillColor:Color.fromRGBO(0, 4, 20, 0.296),
          
//               border: OutlineInputBorder(borderRadius: BorderRadius.circular(50),),
          
//               hintText:"MODEL OR PLATE",
//               hintStyle:TextStyle
//               (  
//                 fontSize:20.5,
//                 color:Color.fromARGB(255, 70, 132, 255),
//                 letterSpacing:1,
//               ),
              
//               searchStyle:TextStyle(color:const Color.fromARGB(255, 255, 255, 255), height:1.7, fontSize:21.5),
              
//               prefixIcon: Icon
//               (
//                 Icons.width_normal_rounded,
//                 size:30,
//                 color:const Color.fromARGB(255, 70, 132, 255),
//               ),
              
//                 // enabledBorder:OutlineInputBorder
//                 // (
//                 //   borderSide:BorderSide
//                 //   (
//                 //     color:Colors.blueGrey.shade200,
//                 //     width:3
//                 //   ),
//                 //   borderRadius:BorderRadius.circular(10),
//                 // ),
            
//                 // focusedBorder:OutlineInputBorder
//                 // (
//                 //   borderSide:BorderSide
//                 //   (
//                 //     color:Colors.blue.withOpacity(0.8),
//                 //     width:2
//                 //   ),
//                 //   borderRadius:BorderRadius.circular(10),
//                 // ),
//               ),
//               itemHeight: 50,
//               maxSuggestionsInViewPort:6, 
//               suggestionsDecoration:SuggestionDecoration
//               (
//                 color:Color.fromRGBO(0, 14, 70, 0.323),
//                 borderRadius: BorderRadius.circular(10),
            
//               ),
//               onTap:() async
//               {
//                 const String value = "";
//                 setState
//                 ((){
//                     _selectedCountry = value;
//                   }
//                 );
//               },
//               suggestions:
//               [
//                 '2011 CORVETTE',
//                 '1930 FERRARI',
//                 '2013 MERCEDES BENZ',
//                 '1969 MUSTANG',
//                 '2008 Honda Accord',
//                 'Australia',
//                 'SHOW MORE',
//               ].map(SearchFieldListItem<String>.new).toList(),

//               // fix this search algorithm.
//               // suggestionState:Suggestion.expand,
//           ),
          
//         ],   
//       ),  
//     ),  
//   ],
// ),
// visible:false,
// ),





















    // Positioned
    // (
    //   top:70,
    //   left:280,
    //   child:MaterialButton
    //   (
    //     minWidth:70,
    //     height:65,
    //     color:Color.fromRGBO(0, 14, 70, 0.4),

    //     padding:EdgeInsets.all(0),
    //     shape: RoundedRectangleBorder
    //     (
    //       borderRadius: BorderRadius.circular(50),
    //     ),
    //     child:Icon
    //     (
    //       Icons.arrow_forward_ios, color:Colors.white, size:24,
    //     ),

    //     onPressed:()
    //     {                   
    //       showDialog
    //       (
    //         context:context,
    //         useSafeArea:false, 
    //         builder:(context)
    //         {
    //           //! THERE IS A BUG HERE IN TERMS OF TEXT ENTERED... 

    //           // _overlayEntry?.remove();

    //           return CircularSeekBarExamplePage();
            
    //           // when text is entered a message is out. 
    //           // return CircularSeekBarExamplePage();
    //         },
            
    //       );
    //     // Loading screen // Downloading specs  
    //     },

    //   ),

    // ),
    // CircularSeekBarExamplePage(),






  // Image.network('https://picsum.photos/250?image=9', width:250,),


  // color:const Color.fromARGB(255, 255, 255, 255),
  // DropdownButtonFormField<String>
  // (
  //   items:<String>['A','B','C','D'].map((String value){return DropdownMenuItem<String>(value:value,child:new Text(value),);}).toList(), onChanged: (_) { },
  // ),

  // Column(
  //   children: [
      
      // DropdownButton(items:<String>['A','B','C','D'].map((String value){return DropdownMenuItem<String>(value:value,child:Text(value),);}).toList(), onChanged: (_) { }),
      
      // https://slimpotatoboy.medium.com/popup-menu-button-with-custom-icon-in-flutter-538f41a794e3
      
    //     ],
    // ),












  // ElevatedButton
  // (
  //   onPressed: () 
  //   { 
  //     showOverlay(context);
  //   }, child: Text('show Overlay'),

  // ),


  // ----------------------------------------------------------------------------
 
  // void showOverlay(BuildContext context) 
  // {
  //   if(_overlayEntry?.mounted??false)
  //   {
  //     _overlayEntry?.remove();
  //     return;
  //   }

  //   _overlayEntry=OverlayEntry

  //   (
  //     builder:(context)
  //     {
  //       return const Positioned
  //       (
  //         top:300.0,
  //         left:100.0,
  //         child: Material
  //         (
  //           child:Center
  //           (
  //             child: Text("close Overlay"),
  //           )
  //           )
          
  //       );
  //     }

  //   );

  //   Overlay.of(context).insert(_overlayEntry!);

  // }










// bottomNavigationBar: const GMenu(), 
// bottomNavigationBar: const SliderBar(),
// bottomNavigationBar: GMenu(option: 1), 


// bottomNavigationBar: Container
// (
//     height: 130,
//     width:double.maxFinite,
//     color:const Color.fromARGB(255, 154, 200, 240),
//     child: Padding
//     (
//       padding: const EdgeInsets.symmetric
//       (
//         vertical:0.0,
//         horizontal:40.0,
//       ),
//       child:Slider.adaptive
//       (
//         min:0.0,
//         max:3.0,
//         value:rating,
//         activeColor:const Color.fromARGB(255, 35, 73, 110),
//         onChanged: (double newRating)
//         {
//           setState
//           (() 
//             {
//               rating = newRating;
//             }
//           );
//         },
//         divisions:3,
//         label:"$rating",
//       ),
//     ) 
// ), 