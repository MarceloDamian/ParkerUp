
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget
{

    final controller; // ! What is final??????
    final String hintText;
    final bool obscureText;
    
    const MyTextField ({
        super.key,
        required this.controller, // !  what is required????
        required this.hintText,
        required this.obscureText,
    });

    @override
    Widget build(BuildContext context)
    {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
                controller: controller,
                obscureText: obscureText,
                decoration: InputDecoration(
                    
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                    ),

                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                    ),

                    fillColor: const Color.fromARGB(255, 246, 232, 232),
                    filled: true,
                    hintText: hintText,
                    hintStyle: TextStyle(color: Colors.blueGrey[400])
                ),
            ),
        );
    }

}