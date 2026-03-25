
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class PrivacyPolicy extends StatelessWidget
{
  PrivacyPolicy ({super.key});
  final user = FirebaseAuth.instance.currentUser!;

  @override 

  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar:AppBar
      (
        backgroundColor:const Color.fromARGB(255, 99, 99, 99),
      ),
      body:Center
      (        
        child:Text
        (
          "Privacy Policy Page ${user.email!}",
          style: const TextStyle
            (
              color:Color.fromARGB(255, 38, 53, 50),
              fontSize: 15,
            ),
        ),
        
      ), 
    );
  }
  
}


