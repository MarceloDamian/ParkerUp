
import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_text_reveal/random_text_reveal.dart';



class Specs_Extended extends StatelessWidget
{
  Specs_Extended({super.key });
  

  @override
  Widget build(BuildContext context)
  {

    return 
    Scaffold
      (
        backgroundColor:Colors.black45,
        body:Column
        (
          children:
          [
            Padding
            (
              padding:EdgeInsets.fromLTRB(20, 200, 0, 0),
              child:RandomTextReveal
              (
                text: 
                'Car: 2014 Honda Accord Ex-L  Model: BMW Size: 30W X 30L Weight: 30 Tons' ,
                initialText: 'Ae8&1pvNQ32ck^^',
                shouldPlayOnStart: true,
                duration: Duration(seconds:2),
                style: GoogleFonts.orbitron
                (
                  textStyle: TextStyle
                  (
                    fontSize: 24,
                    color:Colors.green.shade100,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 8,
                  )
                ),
              randomString: Source.alphabets,
              onFinished: ()
              {
                debugPrint("Password Cracked Successfully");
              },
              curve: Curves.easeIn,
              overflow:TextOverflow.ellipsis,
              maxLines:10,
            ), 
          ),
        ],
      ),

      floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat, // From here below have it be its own component for a page. 
      floatingActionButton:
      Container
      (
        child: Visibility
        ( 
          visible:true,
          child:MyButton
            (
              onPressed:() 
              {  
                print ("true");
                Navigator.pop(context);
              }, 
              text:"CONFIRM", 
              hex: const Color.fromARGB(65, 121, 162, 186), 
              width_: 200, 
              height_: 100, 
              circular:BorderRadius.circular(0), 
            ), 
        ),
      ),

      
    );

  }


  
}