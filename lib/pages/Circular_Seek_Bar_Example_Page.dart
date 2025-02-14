
import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/pages/specs.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_text_reveal/random_text_reveal.dart';



class CircularSeekBarExamplePage extends StatelessWidget
{
  CircularSeekBarExamplePage({super.key, });

  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);  
  bool SwitchAnimation = false;
  

  @override
  void dispose()
  {
    _valueNotifier.dispose();
    // super.dispose();
  }


  @override
  Widget build(BuildContext context)
  {

    return SizedBox
    (
      width:500,
      // height:double.infinity,  
      child: Scaffold
      (
        backgroundColor:Colors.black12,
        // body:Center
        body:Row
        (
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          
          children:<Widget>
          [
            CircularSeekBar
            (
              // width:double.infinity,
              height:double.infinity,
              width:300,
              // height:400,
              progress:100,
              barWidth:16,
              startAngle:45,
              sweepAngle:270,
              strokeCap: StrokeCap.butt,
              progressGradientColors: const [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue,Colors.indigo,Colors.purple],
              innerThumbRadius: 5,
              innerThumbStrokeWidth:3,
              innerThumbColor:Colors.white,
              outerThumbColor:Colors.blueAccent,
              dashWidth:1,
              dashGap:3,
              animation:true,
              valueNotifier:_valueNotifier,
              
              child:Center
              (
                child:ValueListenableBuilder
                (
                  valueListenable: _valueNotifier, 
                  builder: (_, double value, __) 
                  {
                    if (value==100) 
// a bool variable that notifies gmaps if it is 100. 
//if it is then reset css to be nothing and then call the other page specs.dart in gmaps function 
                    {
                      Navigator.pop(context);   

                      
                    }
                    return SizedBox
                    (
                      child: Column
                      (
                        mainAxisSize:MainAxisSize.min,
                        children:
                        [
                          BlinkText
                          (
                            '${value.round()}', 
                            style:const TextStyle(fontSize:25,color:Colors.white),
                            beginColor: Colors.grey,
                            endColor:const Color.fromARGB(255, 255, 255, 255),
                            duration: const Duration(seconds:1),
                          ),
                          // Text('DOWNLOADING SPECS ', style: TextStyle(color: Colors.grey, fontSize:20,)),
                          BlinkText
                          (
                            'DOWNLOADING SPECS', 
                            style: TextStyle(fontSize:19,fontWeight:FontWeight.bold),
                            beginColor: Colors.grey,
                            endColor:Color.fromARGB(255, 255, 255, 255),
                            duration: Duration(seconds:1),
                          ),
                      
                          BlinkText
                          (
                            '...', 
                            style: TextStyle(fontSize:27,fontWeight:FontWeight.bold),
                            beginColor: Colors.grey,
                            endColor:Color.fromARGB(255, 255, 255, 255),
                            duration: Duration(seconds:1),
                          ),
                      
                      
                        if (value==100)... 
                        [     
                        ],                    
                        
                      ],
                    ),
                  );               
                },                       
              ),
            ), 


          ),  



        ],



        ),
      ),
    );
  }
  

  // Widget FinishedCycle ()
  // {
  //   return Specs_Extended();

  // }


  // if (value==100)... // remove all of this dialog and add specs and this button // this is out of scope. 
  // [                          
    // remove all of this dialog and add specs and this button
    // this is out of scope.   

    // MyButton
    // (
    //   onPressed:() 
    //   {  
    //     print ("true");
    //     Navigator.pop(context);
    //   }, 
    //   text: 'CONTINUE', 
    //   hex: const Color.fromARGB(65, 121, 162, 186), 
    //   width_: 150, 
    //   height_: 75, 
    //   circular:BorderRadius.circular(0), 
    // ),                                  
  // ],







// if (value==100)
//                     {

//                       // ______ADDING THIS THATS IN THE BOTTOM_____________
                      
//                       // Navigator.pop(context);
                      

//                       return RandomTextReveal
//                       (
//                         text: 'PASSWORD',
//                         initialText: 'Ae8&vNQ32ck^^',
//                         shouldPlayOnStart: false,
//                         duration: Duration(seconds:2),
//                         style: GoogleFonts.orbitron
//                         (
//                           textStyle: TextStyle
//                           (
//                             fontSize: 24,
//                             color: Colors.green[900],
//                             fontWeight: FontWeight.bold,
//                             letterSpacing: 8,
//                           )
//                         ),
//                       randomString: Source.alphabets,
//                       onFinished: ()
//                       {
//                         debugPrint("Password Cracked Successfully");
//                       },
//                       curve: Curves.easeIn,
//                       overflow:TextOverflow.ellipsis,
//                       maxLines:2,
//                     );
                      
//                       // return Specs_Extended();              

//                       // showDialog
//                       // (
//                       //   context:context,
//                       //   useSafeArea:false, 
//                       //   builder:(context)
//                       //   {
//                       //     return Specs_Extended();
//                       //     // when text is entered a message is out. 
//                       //     // text add flutter pub add random_text_reveal
//                       //   },
//                       // );

//                     }


  
}