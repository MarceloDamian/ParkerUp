///////////////////////////////////
      // style:TextStyle(color:const Color.fromARGB(255, 255, 255, 255), height:2, fontSize:21.5),
      // decoration:InputDecoration
      // (
      //   filled:true,
      //   fillColor:Color.fromRGBO(0, 4, 20, 0.296),
      //   label: Center
      //   (
      //     child: Text
      //     (
      //       "MODEL OR LICENSE PLATE",
            
      //     ),
      //   ),
///////////////////////////////////
library;







                        Container
                        (
                          width =double.infinity,
                          height =MediaQuery.of(context).size.height * 0.7,
      



                          child =Column
                          (
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: 
                            [
                              Container
                              (
                                margin:EdgeInsets.symmetric(horizontal:20),
                                decoration:BoxDecoration
                                (
                                  color:Colors.white,
                                  borderRadius:BorderRadius.circular(10),
                                  boxShadow:
                                  [
                                    BoxShadow
                                    (
                                      color:Colors.grey.withOpacity(0.2),
                                      blurRadius: 10,
                                      offset: Offset(0,10)
                                    ),
                                  ]
                                ),
                                child:SearchField
                                (
                                  hint: "SEARCH PLATE OR CAR MODEL",
                                  searchInputDecoration:SearchInputDecoration
                                  (
                                    enabledBorder:OutlineInputBorder
                                    (
                                      borderSide:BorderSide
                                      (
                                        color:Colors.blueGrey.shade200,
                                        width:1
                                      ),
                                      borderRadius:BorderRadius.circular(10),
                                    ),

                                    focusedBorder:OutlineInputBorder
                                    (
                                      borderSide:BorderSide
                                      (
                                        color:Colors.blue.withOpacity(0.8),
                                        width:2
                                      ),
                                      borderRadius:BorderRadius.circular(10),
                                    ),
                                  ),
                                  itemHeight: 50,
                                  maxSuggestionsInViewPort:6, 
                                  suggestionsDecoration:SuggestionDecoration
                                  (
                                    color:Colors.white,
                                    borderRadius: BorderRadius.circular(10),

                                  ),
                                  onTap:() async
                                  {
                                    const String value = "";
                                    setState
                                    ((){
                                        _selectedCountry = value;
                                      }
                                    );
                                  },
                                  suggestions:[
                                    '2008 Honda Accord',
                                    '2011 inifiniti',
                                    '1930 Ferrari',
                                    '2013 Mercedez bens',
                                    'Paris',
                                    'NYC',
                                    'Australia',
                                    'Brooklyn',
                                  ].map(SearchFieldListItem<String>.new).toList(), 
                                  // fix this search algorithm.
                                  // suggestionState:Suggestion.expand,
                                ),
                              ),
                            ]
                          ),
                        ),

                        Container
                        (
                          height =90,
                          padding =EdgeInsets.only(right:20,left:20,bottom:20),
                          decoration =const BoxDecoration
                          (
                            color:Colors.white,
                          ),
                        ),


// --------------------------------------------------------

    // child: TextField
    // (
      
    //     labelStyle:TextStyle
    //     (  
    //       fontSize:21.5,
    //       color:Color.fromARGB(255, 70, 132, 255),
    //       letterSpacing:1,
    //     ),
    //     border:  OutlineInputBorder(borderRadius: BorderRadius.circular(50),),
        
    //     prefixIcon:  Icon
    //     (
    //       Icons.width_normal_rounded,
    //       size:30,
    //       color:Color.fromARGB(255, 70, 132, 255),
    //     ),
    //   ),



//____________________________________________
    // GestureDetector
    //   (
    //     child:Padding
    //     (
    //       padding:const EdgeInsets.only
    //       (
    //         left : 30.0,
    //         top : 50.0,
    //         right : 0.0,
    //         bottom : 0.0,                
    //       ), 

    //     // UNCOMMENT THIS BELOW!!!!!!!!!!

    //       child: const Icon
    //       (
    //         Icons.car_rental, // Change this to a custom car dart icon
    //         size:48,
    //         color:Color.fromARGB(255, 196, 216, 231),
    //       ),
    //      ),
    //       onTap: ()
    //       {
    //          showOverlay(context);
    //       },  
    // //      
  //CircularSeekBar
  // (
  //   width:double.infinity,
  //   height:250,
  //   progress:100,
  //   barWidth:8,
  //   startAngle:45,
  //   sweepAngle:270,
  //   strokeCap: StrokeCap.butt,
  //   progressGradientColors: const [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue,Colors.indigo,Colors.purple],
  //   innerThumbRadius: 5,
  //   innerThumbStrokeWidth:3,
  //   innerThumbColor:Colors.white,
  //   outerThumbColor:Colors.blueAccent,
  //   dashWidth:1,
  //   dashGap:2,
  //   animation:true,
  //   valueNotifier:_valueNotifier,
  //   child:Center
  //   (
  //     child:ValueListenableBuilder
  //     (
  //       valueListenable: _valueNotifier, 
  //       builder: (_, double value, __) =>
  //         Column
  //         (
  //           mainAxisSize:MainAxisSize.min,
  //           children:
  //           [
  //             Text('${value.round()}', style:TextStyle(color:Colors.white)),
  //             Text('Progress', style: TextStyle(color: Colors.grey)),
  //           ],
  //         ),
  //     ), 
  //   ),

  // ),///////
  ////0----------------
  ////
  ///// import 'dart:convert';

// import 'package:http/http.dart' as http;

import '/model/address.dart';
import '/model/coordinates.dart';
import '/model/response_error.dart';
import '/exception/geocode_exception.dart';

abstract class GeocodeClient {
  /// Returns an [Address] given a [latitude], [longitude]
  /// and an [apiKey].
  Future<Address> reverseGeocoding(
      double latitude, double longitude, String apiKey);

  /// Returns [Coordinates] given an [address] and an [apiKey].
  Future<Coordinates> forwardGeocoding(String address, String apiKey);
}

class GeocodeclientImpl implements GeocodeClient {
  /// API endpoint url.
  final String url = 'geocode.xyz';

  @override
  Future<Address> reverseGeocoding(
      double latitude, double longitude, String apiKey) {
    String urlParams =
        "/$latitude,$longitude";

    Map<String, String> queryParams = {
      'geoit': 'json',
    };

    if (apiKey != '') {
      queryParams.addAll({'auth': apiKey});
    }

    final Uri uri = Uri.https(url, urlParams, queryParams);

    return http.get(uri, headers: {'User-Agent': 'geocode (dart:io)'}).then((response) {
      ResponseError err = ResponseError.fromJson(json.decode(response.body));

      if (err.code != null) {
        throw _handleErrorException(err);
      }

      return Address.fromJson(json.decode(response.body));
    }).catchError((error) => throw error);
  }

  @override
  Future<Coordinates> forwardGeocoding(String address, String apiKey) {
    String urlParams = "/${address.replaceAll(' ', '+')}";

    Map<String, String> queryParams = {
      'geoit': 'json',
    };

    if (apiKey != '') {
      queryParams.addAll({'auth': apiKey});
    }

    final Uri uri = Uri.https(url, urlParams, queryParams);

    return http.get(uri, headers: {'User-Agent': 'geocode (dart:io)'}).then((response) {
      ResponseError err = ResponseError.fromJson(json.decode(response.body));

      if (err.code != null) {
        throw _handleErrorException(err);
      }

      return Coordinates.fromJson(json.decode(response.body));
    }).catchError((error) => throw error);
  }

  /// Given a [ResponseError] it finds out what kind of [GeocodeException] return.
  GeocodeException _handleErrorException(ResponseError responseError) {
    switch (responseError.code) {
      case ResponseError.e002:
        return AccountOutOfCreditsException(
            responseError.message, responseError.code);
      case ResponseError.e003:
        return AuthTokenNotFoundException(
            responseError.message, responseError.code);
      case ResponseError.e005:
        return PostalCodeFormatException(
            responseError.message, responseError.code);
      case ResponseError.e006:
        return RequestThrottledException(
            responseError.message, responseError.code);
      case ResponseError.e007:
        return InvalidQueryException(responseError.message, responseError.code);
      case ResponseError.e008:
        return EmptyResultException(responseError.message, responseError.code);
      default:
        return UnknownErrorException("Unknown error. Try again.", "-1");
    }
  }
}
