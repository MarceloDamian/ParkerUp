
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class TermsAndConditions extends StatelessWidget
{
  TermsAndConditions ({super.key});
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
          "Terms and Conditions Page ${user.email!}",
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


