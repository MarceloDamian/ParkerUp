
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/components/my_menu.dart';



class HomePage extends StatelessWidget{

  HomePage ({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  // void signUserOut()
  // {
  //   FirebaseAuth.instance.signOut();
  // }


  @override 

  Widget build(BuildContext context)
  {
    return Scaffold(

      body:Center
      (        
        child:Text
        (
          "FOR TESTING PURPOSES ${user.email!}",
          style: const TextStyle
            (
              color:Color.fromARGB(255, 38, 53, 50),
              fontSize: 14,
            ),
        ),
        
      ), 
      bottomNavigationBar: const GMenu(),
    );

  // create like a controller for the navbar. 
  // like a dart page similar to login or register page. for navigation and search. 
  // settings will be seperate. 

  }
  

}


// --------------------------------------------- code works below -----------------

// return Scaffold(
    //   bottomNavigationBar:Container(
    //     color: Colors.black,
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(
    //         horizontal:20.0,
    //         vertical:20,
    //       ),
    //       child: GNav(
    //         backgroundColor: Colors.black,
    //         color: Colors.white,
    //         activeColor: Colors.indigoAccent[300],
    //         tabBackgroundColor:Colors.blueAccent.shade200,
    //         gap: 5,

    //         onTabChange: (index)
    //         {
    //           if (index == 1)
    //           {  
    //             Navigator.push(context,MaterialPageRoute(builder:(context)
    //                 {
    //                     return gmaps();
    //                 }
    //                 ),
    //               );
    //           }
    //           // print(index); // navigate based on index.

    //         },
    //         padding: EdgeInsets.all(20), // height of nav bar
    //         tabs: const [
    //           GButton(
    //             icon: Icons.gps_not_fixed_sharp,
    //             text: 'Navigate',
    //           ),
    //           GButton(
    //             icon: Icons.search,
    //             text: 'Search',
    //           ),
    //           GButton(
    //             icon: Icons.settings,
    //             text: 'Settings',
    //           ),
    //         ]
    //       ),
    //     ),
    //   ),
    //