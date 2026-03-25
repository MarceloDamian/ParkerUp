
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Forgot_pw_page.dart';
import '../components/my_textfield.dart';
import '../components/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';


// What is the difference between stateless and statefull widgets.
// What are overrides?
// What is a scaffold?
// What is a super key?

class LoginPage extends StatefulWidget
{
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap}); 
  //! learn more about super keys!

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> 
{
 
    
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    void signUserIn() async
    {
        // show loading circle
        showDialog(
            context:context, 
            builder:(context){
                return const Center (
                    child:CircularProgressIndicator(),
                );
            },
        
        );

        // try signing in 
        try
        { 
            await FirebaseAuth.instance.signInWithEmailAndPassword(
                email:emailController.text,
                password:passwordController.text,
            );
            Navigator.pop(context);

        } on FirebaseAuthException catch (e)
        {
            Navigator.pop(context);

            if (e.code == 'user-not-found')
            {
                errormessage("Incorrect email");
            }
            else if (e.code == 'wrong-password')
            {
                errormessage("Incorrect Password");
            }

        }

    }

    void errormessage(String message)
    {
        showDialog(
            context:context, 
            builder:(context)
            {
                return AlertDialog(
                    title: Text(message),
                );
            },
        );
    }



    @override
    Widget build(BuildContext context)
    {
        return Scaffold
        (
            backgroundColor: const Color.fromARGB(255, 36, 36, 36),
            body: SafeArea
            (
                child: Center
                (
                    child: SingleChildScrollView
                    (
                        child: Column
                        (
                            children: // this is odd ... kind of like an array? 
                            [ 
                                const SizedBox(height: 150),
                                // Front End Message
                                const Text
                                ( // added const
                                    "ParkerUp",
                                    style: TextStyle
                                    (
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 50,
                                    ),
                                    // textAlign: TextAlign.center,
                                ),

                                // emailController

                                const SizedBox(height: 100),

                                MyTextField
                                (
                                    controller: emailController,
                                    hintText: 'Email',
                                    obscureText: false,
                                    //  Color.fromARGB(255, 255, 255, 255),

                                ),

                                const SizedBox(height: 50),

                                MyTextField
                                (
                                    controller: passwordController,
                                    hintText: 'Password',
                                    obscureText: true, // to hide password
                                ),
                                
                                const SizedBox(height: 50),

                                // Sign in button

                                MyButton
                                (
                                  circular: BorderRadius.circular(50), 
                                  width_:350,
                                  height_: 70,
                                  hex:const Color.fromARGB(255, 71, 192, 67),
                                  text: "Sign In",
                                  onPressed: signUserIn,
                                ),


                                const SizedBox(height: 30),

                                // Forget pass
                                
                                Padding
                                (
                                    padding: const EdgeInsets.symmetric(horizontal:25.0 ), // added const here
                                    child: Row
                                    (                       
                                        mainAxisAlignment:MainAxisAlignment.center,
                                        children:
                                        [
                                            GestureDetector(
                                              onTap: (){
                                                    Navigator.push(context,MaterialPageRoute(builder:(context){
                                                      return const ForgotPasswordPage();
                                                    },
                                                  ),
                                                );
                                              }, 
                                              child: const Text
                                              (
                                                  'Forgot Password ? ', 
                                                  style: TextStyle
                                                  (
                                                      color:Color.fromARGB(255, 6, 197, 184),
                                                      fontSize: 14,
                                                  ),
                                              ),
                                            ),
                                        ],
                                    ),
                                ),


                                const SizedBox(height: 25),

                                // or continue with ...
                                Padding
                                (
                                    padding: const EdgeInsets.symmetric(horizontal:25.0),
                                    child:Row
                                    (
                                        children: 
                                        [
                                            Expanded
                                            (
                                                child: Divider
                                                ( 
                                                    thickness:0.5,
                                                    color: Colors.grey[400]
                                                ),
                                            ),

                                            Padding
                                            (
                                                padding: const EdgeInsets.symmetric(horizontal:10.0),
                                                child: Text
                                                (
                                                    ' Or Continue With? ',
                                                    style: TextStyle(color:Colors.grey[700]),
                                                ),
                                            ),

                                            Expanded(
                                                child: Divider( 
                                                    thickness:0.5,
                                                    color: Colors.grey[400]
                                                ),
                                            ), 

                                        ],
                                    ),
                                ),
                        
                                // google + apple sign in buttons // Not done. 

                                const SizedBox(height: 20),

                                // not a member? Register now. 
                                Row
                                (
                                    mainAxisAlignment:MainAxisAlignment.center,
                                    children: 
                                    [
                                        Text
                                        (
                                            'Not a Member? ',
                                            style: TextStyle
                                            (
                                                color:Colors.grey[700],
                                            ),
                                        ),
                                        
                                        const SizedBox(width:4),

                                        GestureDetector
                                        (
                                            onTap: widget.onTap,
                                            child: const Text //! this child and const has been added 
                                            ( // added const 
                                                'Register Now ',
                                                style: TextStyle
                                                (
                                                    color: Colors.blue, 
                                                    fontWeight: FontWeight.bold,
                                                ),
                                            ),
                                        ),
                                    ],
                                ),
                            ],
                        ),
                    ),
                ),
            ),
        );

    }
}