import 'package:flutter/material.dart';

class MyButton extends StatelessWidget
{
  final Function()? onPressed;
  final String text;
  final Color hex;
  final double height_;
  final double width_;
  final BorderRadius circular;



  const MyButton( 
    {
    super.key, 
    required this.onPressed, 
    required this.text,
    
    required this.hex,
    required this.height_,
    required this.width_,
    required this.circular,
  });

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        // padding:const EdgeInsets.all(25),
        // margin: const EdgeInsets.symmetric(horizontal:25),
        width:width_,
        height:height_,
        decoration: BoxDecoration(
          // color: const Color(0xff7c94b6),
          color: hex,
          borderRadius: circular,
          border: Border.all(color:const Color.fromARGB(198, 17, 16, 16)),
          // BorderRadius.circular(4), 
        ),
        child: Center(
          child: Text(  
            text, 
            style: const TextStyle(
              color:Colors.white,
              fontWeight:FontWeight.bold,
              fontSize:16,
    
            ),
          ),
        ),
      ),
    );
  }


}