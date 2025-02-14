






import 'dart:io';

import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/pages/settings_page.dart';



class EditProfile extends StatelessWidget
{
  EditProfile ({super.key});
  final user = FirebaseAuth.instance.currentUser!;


  // added below!!!

  DateTime dateTime = DateTime.now();
  
  // DateTime.utc(1989, 11, 9)
  // DateTime.parse('1969-07-20 20:18:04Z')

  final alarmSettings = AlarmSettings
  (
    id: 42,
    dateTime: DateTime.now(),
    assetAudioPath: 'assets/alarm.mp3',
    loopAudio: true,
    vibrate: true,
    volume: 0.8,
    fadeDuration: 3.0,
    warningNotificationOnKill: Platform.isIOS,
    androidFullScreenIntent: true,
    notificationSettings: const NotificationSettings
    (
      title: 'This is the title',
      body: 'This is the body',
      stopButton: 'Stop the alarm',
      icon: 'notification_icon',
    ),
  );






  @override 

  Widget build(BuildContext context)
  {
    
    return Scaffold
    (
      backgroundColor:const Color.fromARGB(255, 39, 38, 38),

      appBar:AppBar
      (
        backgroundColor:const Color.fromARGB(255, 99, 99, 99),
      ),
      body:Center
      (        

        child:Column
        (
          children:
          [
            
            // await Alarm.set(alarmSettings: alarmSettings), 
            // ! above needs to be added the right way  

            Padding
            (
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),

              child:Align
              (
                  alignment:Alignment.center,
                  child: Text
                  (
                    "EDIT PROFILE",
                    style:TextStyle
                    (
                      fontSize:45,
                      fontWeight:FontWeight.w600,
                      color:Color.fromARGB(238, 255, 255, 255),
                    
                    ),
                    
                  ),
              ),
            ),


            Padding
            (
              padding: EdgeInsets.fromLTRB(57, 20, 0, 7),

              child:Align
              (
                  alignment:Alignment.centerLeft,
                  child: Text
                  (
                    "Name:",
                    style:TextStyle
                    (
                      fontSize:17,
                      color:Color.fromARGB(255, 255, 255, 255),
                    
                    ),
                    
                  ),
              ),
            ),

            SizedBox
            (
              width:275,
              child:TextFormField
              (   
                style:const TextStyle
                (
                  color:Color.fromARGB(255, 0, 0, 0),
                  fontSize:20,
                ),
                decoration: InputDecoration
                (
                  filled:true,
                  fillColor: const Color.fromARGB(210, 221, 214, 214).withOpacity(0.5),
                  // labelText: 'Name',
                  border:  const OutlineInputBorder(),
                          
                  labelStyle:const TextStyle
                  (
                    color: Color.fromARGB(255, 141, 124, 124),
                    letterSpacing:1,
                  ),                       
                ),
              ),
            ),

            
            Padding
            (
              padding: EdgeInsets.fromLTRB(57, 30, 0, 7),

              child:Align
              (
                  alignment:Alignment.centerLeft,
                  child: Text
                  (
                    "Email Address:",
                    style:TextStyle
                    (
                      fontSize:17,
                      color:Color.fromARGB(255, 255, 255, 255),
                    
                    ),
                    
                  ),
              ),
            ),

            SizedBox
            (
              width:275,
              child:TextFormField
                (   
                  style:const TextStyle
                  (
                    fontSize:20,
                    color:Color.fromARGB(255, 0, 0, 0),
                  ),
                  decoration: InputDecoration
                  (
                    filled:true,
                    fillColor: const Color.fromARGB(210, 221, 214, 214).withOpacity(0.5),
                    // labelText: 'Name',
                    border:  const OutlineInputBorder(),
                            
                    labelStyle:const TextStyle
                    (
                      color: Color.fromARGB(255, 141, 124, 124),
                      letterSpacing:1,
                    ),                       
                  ),
                ),
            ),

            Padding
            (
              padding: EdgeInsets.fromLTRB(57, 30, 0, 7),

              child:Align
              (
                  alignment:Alignment.centerLeft,
                  child: Text
                  (
                    "Alert #1:",
                    style:TextStyle
                    (
                      fontSize:17,
                      color:Color.fromARGB(255, 255, 255, 255),
                    
                    ),
                    
                  ),
              ),
            ),

            SizedBox
            (
              width:275,
              child:TextFormField
                (   
                  style:const TextStyle
                  (
                    fontSize:20,
                    color:Color.fromARGB(255, 0, 0, 0),
                  ),
                  decoration: InputDecoration
                  (
                    filled:true,
                    fillColor: const Color.fromARGB(210, 221, 214, 214).withOpacity(0.5),
                    // labelText: 'Name',
                    border:  const OutlineInputBorder(),
                            
                    labelStyle:const TextStyle
                    (
                      color: Color.fromARGB(255, 141, 124, 124),
                      letterSpacing:1,
                    ),                       
                  ),
                ),
            ),

            Padding
            (
              padding: EdgeInsets.fromLTRB(57, 30, 0, 7),

              child:Align
              (
                  alignment:Alignment.centerLeft,
                  child: Text
                  (
                    "Alert #2:",
                    style:TextStyle
                    (
                      fontSize:17,
                      color:Color.fromARGB(255, 255, 255, 255),
                    
                    ),
                    
                  ),
              ),
            ),

            SizedBox
            (
              width:275,
              child:TextFormField
                (   
                  style:const TextStyle
                  (
                    fontSize:20,
                    color:Color.fromARGB(255, 0, 0, 0),
                  ),
                  decoration: InputDecoration
                  (
                    filled:true,
                    fillColor: const Color.fromARGB(210, 221, 214, 214).withOpacity(0.5),
                    // labelText: 'Name',
                    border:  const OutlineInputBorder(),
                            
                    labelStyle:const TextStyle
                    (
                      color: Color.fromARGB(255, 141, 124, 124),
                      letterSpacing:1,
                    ),                       
                  ),
                ),
            ),
          


            Padding
            (
              padding: EdgeInsets.fromLTRB(0, 50, 0, 5),

              child:MyButton
              (
                onPressed:() 
                {
                  Navigator.of(context).pop(MaterialPageRoute(builder: (context) => SettingsPage()));
                },
                text: "Save Changes",
                hex:Colors.black87,
                height_: 75,
                width_: 300,
                circular: BorderRadius.circular(10), 
              ),

            ),


        // child:Text
        // (
        //   "Edit Profile Page ${user.email!}",
        //   style: const TextStyle
        //     (
        //       color:Color.fromARGB(255, 38, 53, 50),
        //       fontSize: 15,
        //     ),
        // ),
          ],
        ), 
      ),
    );
  }
  
}









// ------------------------------------OlD IMPLEMENTED SEARCH BAR-------------



// import 'package:flutter/material.dart';
// import 'package:searchfield/searchfield.dart';
// // import 'package:searchfield/searchfield.dart';


// class EditProfile extends StatefulWidget
// {
//   const EditProfile({super.key}); 
//   //! learn more about super keys!

//   @override
//   State<EditProfile> createState() => _EditProfileState();
//   // _SearchableDropdownState createState() => _SearchableDropdownState();
  
// }








// class _EditProfileState extends State<EditProfile>
// {

//   String? _selectedCountry;
  
//   @override

//   Widget build(BuildContext context)
//   {
//     return Scaffold
//     (



      // appBar:AppBar
      // (
      //   elevation:0,
      //   backgroundColor:Colors.white,
      //   // title:Text
      //   // (
      //   //   "Hello World", 
      //   //   style:TextStyle
      //   //   (
      //   //     color:Colors.black
      //   //   ),
      //   // ),
      // ),
      // body:Container
      // (
      //   child:Column
      //   (
      //     mainAxisAlignment:MainAxisAlignment.spaceBetween,
      //     children:
      //     [
      //       Container
      //       (
      //         width:double.infinity,
      //         height:MediaQuery.of(context).size.height * 0.7,

      //         child:Column
      //         (
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: 
      //           [
      //             Padding
      //             (
      //               padding:EdgeInsets.all(20),
      //               child:Text
      //               (
      //                 "SELECT YOUR CAR", 
      //                 style:TextStyle
      //                 (
      //                   fontSize:16,
      //                   color:Colors.blueGrey,
      //                 ),
      //               ),
      //             ),
      //             Container
      //             (
      //               margin:EdgeInsets.symmetric(horizontal:20),
      //               decoration:BoxDecoration
      //               (
      //                 color:Colors.white,
      //                 borderRadius:BorderRadius.circular(10),
      //                 boxShadow:
      //                 [
      //                   BoxShadow
      //                   (
      //                     color:Colors.grey.withOpacity(0.2),
      //                     blurRadius: 10,
      //                     offset: Offset(0,10)
      //                   ),
      //                 ]
      //               ),


      //               child:SearchField
      //               (
      //                 hint: "SEARCH PLATE OR CAR MODEL",
      //                 searchInputDecoration:SearchInputDecoration
      //                 (
      //                   enabledBorder:OutlineInputBorder
      //                   (
      //                     borderSide:BorderSide
      //                     (
      //                       color:Colors.blueGrey.shade200,
      //                       width:1
      //                     ),
      //                     borderRadius:BorderRadius.circular(10),
      //                   ),

      //                   focusedBorder:OutlineInputBorder
      //                   (
      //                     borderSide:BorderSide
      //                     (
      //                       color:Colors.blue.withOpacity(0.8),
      //                       width:2
      //                     ),
      //                     borderRadius:BorderRadius.circular(10),
      //                   ),
      //                 ),
      //                 itemHeight: 50,
      //                 maxSuggestionsInViewPort:6, 
      //                 suggestionsDecoration:SuggestionDecoration
      //                 (
      //                   color:Colors.white,
      //                   borderRadius: BorderRadius.circular(10),

      //                 ),
      //                 onTap:() async
      //                 {
      //                   const String value = "";
      //                   setState
      //                   ((){
      //                       _selectedCountry = value;
      //                     }
      //                   );
      //                 },
      //                 suggestions:[
      //                   '2008 Honda Accord',
      //                   '2011 inifiniti',
      //                   '1930 Ferrari',
      //                   '2013 Mercedez bens',
      //                   'Paris',
      //                   'NYC',
      //                   'Australia',
      //                   'Brooklyn',
      //                 ].map(SearchFieldListItem<String>.new).toList(), 
      //                 // fix this search algorithm.
      //                 // suggestionState:Suggestion.expand,
      //               ),





      //             ),
      //           ]
      //         ),
      //       ),
      //       Container
      //       (
      //         height:90,
      //         padding:EdgeInsets.only(right:20,left:20,bottom:20),
      //         decoration:BoxDecoration
      //         (
      //           color:Colors.white,
      //         ),
      //         // child:Row
      //         // (
      //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         //   children:
      //         //   [
      //         //     _selectedCountry == null ? Text
      //         //     (
      //         //       'Please Select a Country',
      //         //       style: TextStyle
      //         //       (

      //         //       ),
                  
      //         //     ) : Text (_selectedCountry!, style:TextStyle(
      //         //       color: Colors.grey.shade800,
      //         //       fontSize:16,
      //         //       fontWeight: FontWeight.w600,
      //         //     ),
      //         //     ),
      //         //     MaterialButton
      //         //     (
      //         //       onPressed: () {
      //         //       },
      //         //       minWidth:50,
      //         //       height:50,
      //         //       color:Colors.black,
      //         //       padding:EdgeInsets.all(0),
      //         //       shape: RoundedRectangleBorder
      //         //       (
      //         //         borderRadius: BorderRadius.circular(50),
      //         //       ),
      //         //       child:Icon(Icons.arrow_forward_ios, color:Colors.white, size:24),
                  
      //         //     ),
      //         //   ],
      //         // )
      //       ),
      //     ]
      //   ),



      // )



//     );
//   }


// }




















// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';


// // TODO: 
// // Finish all individual pages. 
//   // Add gmail functionality on sign up screen
//   // add car search on top of the google maps scrren and that page as well.
//   // draw markers etc on google maps using data from apis. 
//   // search settings has to be completed
//   // color of search has to be done too. 




// class EditProfile extends StatelessWidget
// {
//   EditProfile ({super.key});
//   final user = FirebaseAuth.instance.currentUser!;

//   @override 

//   Widget build(BuildContext context)
//   {
//     return Scaffold
//     (

//       appBar:AppBar
//       (
//         backgroundColor:const Color.fromARGB(255, 99, 99, 99),
//       ),
      
//       body:Center
//       (   
//         SearchField(),



//         // child:Text
//         // (
//         //   "Edit Profile Page ${user.email!}",
//         //   style: const TextStyle
//         //     (
//         //       color:Color.fromARGB(255, 38, 53, 50),
//         //       fontSize: 15,
//         //     ),
//         // ),
        





//       ), 

//     );
//   }
  

//   void _showSnackbar(BuildContext context, String message)
//   {
//     ScaffoldMessenger.of(context).showSnackBar
//     (
//       SnackBar(content: Text(message),),
//     );
//   }

// }
