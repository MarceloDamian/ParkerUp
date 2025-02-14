


import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


// have a seperate restricted api for each device. one api for android, another for ios and another for web. 
// add a secret backdoor for the api key for android. 
// Follow the instructions in "https://developers.google.com/maps/flutter-package/config"
// market so all carplays have it. 

// Add markers where fire hydrants are. 
// integrate login page from parky
// have an option to klogin in as a potential person that wants to rent out their parking space
// have a slide up widnow and a search bar to to search for a location. 
// mark either red or green or yellow parking spots along with a percentage. 

// Note to self: this data is only for nyc. Daunting for expansion.

// Fire Hydrants (static data such as geojson or csv): https: //data.cityofnewyork.us/Environment/NYCDEP-Citywide-Hydrants/6pui-xhxz
// Api/Library SDK's Data: https:// dev.socrata.com
// Use python (dataset management api) at https:// dev.socrata.com/consumers/getting-started
// You are going to use geojson with geopandas. With geopandas you can also alter the maps colors so it is a win win scenario.

// no parking signs available by opendata as well. web is https:// data.cityofnewyork.us/Transportation/Street-Sign-Work-Orders/qt6m-xctn/data_preview

// find houses with parking spaces and rentable parking spaces. // Use ATTOM api at https:// www. attomdata.com/solutions/property-navigator/pricing/  the price is 500 a year. 

// set up firebase for user security



// set up a terms and conditions and non liability 
// set up contracts to be able to use within certain hours or days and what type of car would be able to fit. and also payment plan for this. 

// set up plaid or stripe for payment plan for some subscription based depending on featues that are not part of the core plan.  

// Find a good tech to manage and crowdsource, it has to be updated at real time.  

// ! fix email sign up ! it has some edge cases. 


void main () async 
{
  WidgetsFlutterBinding.ensureInitialized();
 
  await Firebase.initializeApp
  (
    options: DefaultFirebaseOptions.currentPlatform,

  );


  // !Added for ALARM 12/6/2024
  // ----------------------------------------------------------------------------------
  
  // WidgetsFlutterBinding.ensureInitialized();
  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // await Alarm.init();

  // ----------------------------------------------------------------------------------



  runApp
  (
    const MyApp()
  );

}


// Future<void> main_() async 
// {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

//   await Alarm.init();
// }




class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  // This widget is the root of your application.
  @override   
   Widget build(BuildContext context)
   {
    return const MaterialApp
    (
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
   }

}

// what is a stateless widget? What is a stateful widget?



// --------------------------------- GOOGLE MAPS BELOW API BELOW ------------------------------------

// class MyApp extends StatefulWidget{
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//    State createState() => _MyAppState();
// }





// class _MyAppState extends State <MyApp>{
//   late GoogleMapController mapController;
//   final LatLng _center = const LatLng (40.68658779998126, -73.91463750377459); // decimal points matter when looking at location.

//   void _onMapCreated (GoogleMapController controller)
//   {
//     mapController = controller;
//   }

//   @override
//   Widget build(BuildContext context) 
//   {
//     return MaterialApp(

//       home:Scaffold(
//         appBar:AppBar(
//           title: const Text ('Maps Sample APP'),
//           backgroundColor:Colors.green[700],
//         ),

//       body: GoogleMap(
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: _center, 
//           zoom: 18.0,
//         ),
//       ),
//       )
//     );  
//   }
// }



// --------------------------------- GOOGLE MAPS BELOW API ABOVE ------------------------------------
