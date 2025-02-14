
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/components/my_textfield.dart';

class ForgotPasswordPage extends StatefulWidget{

  const ForgotPasswordPage({super.key});



  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();

}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>{
  
  final EmailController = TextEditingController();

  @override
  void dispose() // neccessary???
  {
    EmailController.dispose();
    super.dispose();
  }

  Future PasswordReset() async
  {
    try
    {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: EmailController.text.trim());
        showDialog(context:context,builder:(context)
        {
          return const AlertDialog(
            content: Text("Password reset link has been sent. ",
          ),);
        }); 
    }
    on FirebaseAuthException catch (e) 
    {
      print(e);
      showDialog(context:context,builder:(context)
      {
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      }); 
    }
  }
  


  @override

  Widget build(BuildContext context) {
    
    return Scaffold
    (
      
      backgroundColor: const Color.fromARGB(255, 36, 36, 36),

      appBar: AppBar
      (
        backgroundColor:const Color.fromARGB(255, 119, 117, 117),
        elevation: 0,
      ),
      body:Column
      (
        mainAxisAlignment:MainAxisAlignment.center,

        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal:25.0),
            child: Text
            (
              "Enter your email to reset your password.",
              textAlign: TextAlign.center,
              style: TextStyle
              (
                color:Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),

          const SizedBox(height:10),

          MyTextField
          (
              controller: EmailController,
              hintText: 'Email',
              obscureText: false,
          ),

          const SizedBox(height:10),



          MyButton
          (
            circular: BorderRadius.circular(10), 
            width_:300,
            height_: 60,
            hex:const Color.fromARGB(32, 255, 255, 255),
            text: 'Reset Password', 
            onPressed: PasswordReset,
          ),

        ],
      ),
    );

  }

}