
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SliderBar extends StatefulWidget
{
  const SliderBar({super.key});

  @override
  State<SliderBar> createState() => _MyAppState();
}

class _MyAppState extends State<SliderBar> {
  // This widget is the root of your application.
  @override   
   Widget build(BuildContext context)
   {
    double value = 40;
    return SizedBox(
        width:double.maxFinite,

        child: CupertinoSlider(
            min:0.0,
            max:100.0,
            value: value,
            onChanged: (value)
            {
              setState((){
                value = value;
              });
            },
        ),

        
    );
   }
}


class HomePage extends StatelessWidget{

  HomePage ({super.key});
  final user = FirebaseAuth.instance.currentUser!;
  @override 

  Widget build(BuildContext context)
  {
    return const Scaffold
    (
      bottomNavigationBar:SliderBar(),
    );
  }
}



// --------------------------------------------- code works below -----------------
