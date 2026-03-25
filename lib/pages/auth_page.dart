
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/pages/gmapspage.dart';

import 'package:flutter_application_1/pages/login_or_register_page.dart';



class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: StreamBuilder<User?>
      (
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot)
        {
          if (snapshot.hasData)
          {
            // return SearchBarApp();            
            return const gmaps();
          }
          else
          {
            return const LoginOrRegisterPage(); //2:40 mark email sign up
          }
        }
      ),

    );
  }


}