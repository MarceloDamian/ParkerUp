
import 'package:flutter/material.dart';
import '../components/my_textfield.dart';
import '../components/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';


// What is the difference between stateless and statefull widgets.
// What are overrides?
// What is a scaffold?
// What is a super key?

class RegisterPage extends StatefulWidget
{
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap}); 
  //! learn more about super keys!

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> 
{
 
    
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmedPasswordController = TextEditingController();

  void signUserUp() async
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
      

      // try creating the user
      try
      { 
        if (passwordController.text == confirmedPasswordController.text)
        { 
          await FirebaseAuth.instance.createUserWithEmailAndPassword
          (
            email:emailController.text,
            password:passwordController.text,
          );
        }
        else
        {
          errormessage("Passwords don't match");  
        }

        Navigator.pop(context);
      } 
      on FirebaseAuthException catch (e)
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
                                const SizedBox(height: 100),
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

                                const SizedBox(height: 70),

                                MyTextField
                                (
                                    controller: emailController,
                                    hintText: 'Email',
                                    obscureText: false,
                                ),

                                const SizedBox(height: 80),

                                //password
                                MyTextField
                                (
                                    controller: passwordController,
                                    hintText: 'Password',
                                    obscureText: true, // to hide password
                                ),
                                 
                                const SizedBox(height: 20),

                                // Confirm password textfield

                                MyTextField
                                (
                                    controller: confirmedPasswordController,
                                    hintText: 'Confirm Password',
                                    obscureText: true, // to hide password
                                ),
                                
                                const SizedBox(height: 30),

                                // Sign in button

                                MyButton
                                (
                                  circular: BorderRadius.circular(50), 
                                  width_:350,
                                  height_: 70,
                                  hex: const Color.fromARGB(255, 0, 0, 0),
                                  text: "Sign Up",
                                  onPressed: signUserUp,
                                ),

                                const SizedBox(height: 30),

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
                                            
                                            Text
                                            (
                                                ' Or Continue With? ',
                                                style: TextStyle(color:Colors.grey[700]),
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

                                const SizedBox(height: 10),

                                // not a member? Register now. 
                                Row
                                (
                                    mainAxisAlignment:MainAxisAlignment.center,
                                    children: 
                                    [
                                        Text
                                        (
                                            'Already have an account? ',
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
                                                'Login Now ',
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