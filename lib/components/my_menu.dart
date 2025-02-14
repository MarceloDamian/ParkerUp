
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/gmapspage.dart';
import 'package:flutter_application_1/pages/settings_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class GMenu extends StatelessWidget{

    // final int option;
    
    const GMenu ({
        super.key,
        // required this.option,
    });

    @override
    Widget build(BuildContext context)
    {
        return Container(
          // bottomNavigationBar:Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // horizontal:20.0,
                vertical:20,
              ),
              child:GNav
              (
                backgroundColor: Colors.black,
                color: Colors.white,
                activeColor: Colors.indigoAccent[300],
                tabBackgroundColor:Colors.blueAccent.shade200,
                gap: 2,

                onTabChange: (index)
                {
                  if (index == 0) 
                  {  
                    Navigator.push(context,MaterialPageRoute(builder:(context)
                    {
                        return const gmaps();
                    },),);
                  }
                  else if (index == 1) 
                  {  
                    Navigator.push(context,MaterialPageRoute(builder:(context)
                    {
                        return const SettingsPage();
                    },),);
                  }
                  else if (index == 2) 
                  {  
                    Navigator.push(context,MaterialPageRoute(builder:(context)
                    {
                        return HomePage();
                    },),);
                  }
                  // print(index); // navigate based on index.

                },
                padding: const EdgeInsets.all(20), // height of nav bar

                tabs: const 
                [
                  GButton
                  (
                    icon: Icons.gps_not_fixed_sharp,
                    text: 'Navigate',
                  ),
                  GButton
                  (
                    icon: Icons.settings,
                    text: 'Settings',
                  ),
                  GButton
                  (
                    icon: Icons.select_all,
                    text: 'Change',
                  ),     
                ]
              ),
            ),
        );
        
    }

}









// class SliderBar extends StatefulWidget
// {
//   const SliderBar({super.key});

//   @override
//   State<SliderBar> createState() => _MyAppState();
// }

// class _MyAppState extends State<SliderBar> {
//   // This widget is the root of your application.
//   @override   
//    Widget build(BuildContext context)
//    {
//     double _value = 40;
//     return Container(
//         width:double.maxFinite,

//         child: CupertinoSlider(
//             min:0.0,
//             max:100.0,
//             value: _value,
//             onChanged: (value)
//             {
//               setState((){
//                 _value = value;
//               });
//             },
//         ),

        
//     );
//    }
// }











            //width:double.maxFinite,
            // child: CupertinoSlider(
            //     min:0.0,
            //     max:100.0,
            //     value: _value,
            //     onChanged: (value)
            //     {
            //       setState((){
            //         _value = value;
            //       });
            //     },

            // ),