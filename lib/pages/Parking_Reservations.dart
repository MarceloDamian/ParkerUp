
import 'package:flutter/material.dart';

class ParkingReservations extends StatelessWidget
{
  const ParkingReservations({super.key});
  
  @override
  
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      title:'Example',
      theme: ThemeData
      (
        primaryColor: Colors.blue,
        brightness: Brightness.dark,
      ),
      // home: const CircularSeekBarExamplePage(),


    );
  }
}









  // class CircularSeekBarExamplePage extends StatefulWidget
  // {
  //   const CircularSeekBarExamplePage({Key? key}) : super (key: key);

  //   @override 
    
  //   State<CircularSeekBarExamplePage> createState() =>
  //     _CircularSeekBarExamplePageState();
  
  // }

  // class _CircularSeekBarExamplePageState extends State<CircularSeekBarExamplePage>
  // {
  //     final ValueNotifier<double> _valueNotifier = ValueNotifier(0);

  //     @override
  //     void dispose()
  //     {
  //       _valueNotifier.dispose();
  //       super.dispose();
  //     }


  //     @override
  //     Widget build(BuildContext context)
  //     {

  //       return Scaffold
  //       (
  //         body:Center
  //         (
  //           child:Column
  //           (
  //             children:<Widget>
  //             [
  //               CircularSeekBar
  //               (
  //                 width:double.infinity,
  //                 height:250,
  //                 progress:100,
  //                 barWidth:8,
  //                 startAngle:45,
  //                 sweepAngle:270,
  //                 strokeCap: StrokeCap.butt,
  //                 progressGradientColors: const [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue,Colors.indigo,Colors.purple],
  //                 innerThumbRadius: 5,
  //                 innerThumbStrokeWidth:3,
  //                 innerThumbColor:Colors.white,
  //                 outerThumbColor:Colors.blueAccent,
  //                 dashWidth:1,
  //                 dashGap:2,
  //                 animation:true,
  //                 valueNotifier:_valueNotifier,
  //                 child:Center
  //                 (
  //                   child:ValueListenableBuilder
  //                   (
  //                     valueListenable: _valueNotifier, 
  //                     builder: (_, double value, __) =>
  //                       Column
  //                       (
  //                         mainAxisSize:MainAxisSize.min,
  //                         children:
  //                         [
  //                           Text('${value.round()}', style:TextStyle(color:Colors.white)),
  //                           Text('Progress', style: TextStyle(color: Colors.grey)),
  //                         ],
  //                       ),
  //                   ), 
  //                 ),

  //               ),

  //             ],
  //           ),
  //         ),
  //       );

  //     }

  // }



















// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';



// class ParkingReservations extends StatelessWidget
// {
//   ParkingReservations ({super.key});
//   final user = FirebaseAuth.instance.currentUser!;

//   @override 

//   Widget build(BuildContext context)
//   {
//     return Scaffold
//     (
//       appBar:AppBar
//       (
//         backgroundColor:const Color.fromARGB(255, 99, 99, 99),
//       ),
//       body:Center
//       (        
//         child:Text
//         (
//           "Parking Reservations Page ${user.email!}",
//           style: const TextStyle
//             (
//               color:Color.fromARGB(255, 38, 53, 50),
//               fontSize: 15,
//             ),
//         ),
        
//       ), 
//     );
//   }
  
// }


