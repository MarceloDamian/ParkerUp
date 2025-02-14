import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/pages/device_permissions.dart';
import 'package:flutter_application_1/pages/edit_profile.dart';
import 'package:flutter_application_1/pages/Parking_Reservations.dart';
import 'package:flutter_application_1/pages/privacy_policy.dart';
import 'package:flutter_application_1/pages/reset_password.dart';
import 'package:flutter_application_1/pages/terms_and_conditions.dart';





class CustomAppBar extends StatelessWidget implements PreferredSizeWidget
{
  final double height;
  final Widget topChild;
  final AppBar appBar;
  
  const CustomAppBar
  (
    {
      super.key,
      this.height=105.0,
      required this.topChild,
      required this.appBar,
    }
  );

  @override

  Widget build(BuildContext context)
  {
    return Column
    (
      children: [
     
        appBar,
        Expanded(child:topChild),
      ]
    );
  }
  @override 
  Size get preferredSize => Size.fromHeight(height);

}










class SettingsPage extends StatefulWidget
{

  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();

}



class _SettingsPageState extends State<SettingsPage>
{  
  
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // void signUserOut()
  // {
  //   FirebaseAuth.instance.signOut();
  // }

  final user = FirebaseAuth.instance.currentUser!;


  signUserOut() async 
  {
    await _firebaseAuth.signOut();
  }

  @override

  Widget build(BuildContext context) 
  {

    return Scaffold
    (
      backgroundColor: const Color.fromARGB(255, 36, 36, 36),

      appBar:CustomAppBar
      (
        topChild:SizedBox
        (
              child:TextFormField
              (   
                style:const TextStyle(color:Color.fromARGB(255, 255, 255, 255)),

                decoration: InputDecoration
                (
                  filled:true,
                  fillColor: const Color.fromRGBO(0, 0, 0, 0.8).withOpacity(0.5),
                  labelText: 'Search Settings',
                  border:  const OutlineInputBorder(),

                  labelStyle:const TextStyle
                  (

                    color: Color.fromARGB(255, 93, 182, 96),
                    letterSpacing:1,
                  ),
                  prefixIcon:  const Icon
                  (
                    Icons.search,
                    color:Color.fromARGB(255, 34, 119, 48),
                  ),
                                         
              ),
          ),
            
        ),
        appBar:AppBar
        (
          // backgroundColor:const Color.fromARGB(255, 170, 170, 170),
          backgroundColor:const Color.fromARGB(255, 99, 99, 99),
          
        ),

      ),
      

      body: Center
      (
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Column(
              children: 
              [

                MyButton
                (
                  circular:BorderRadius.circular(0), 
                  width_:393,
                  height_: 95,
                  hex:const Color.fromARGB(255, 36, 36, 36),
                  onPressed:() 
                  { 
                    Navigator.push(context,MaterialPageRoute(builder:(context)
                    {
                      
                      
                      // return PersonalDetails();
                      return EditProfile();



                    },),);
                  },
                  text: 'Edit Profile',
                ),

                // const SizedBox(height: 10),

                MyButton
                (
                  circular:BorderRadius.circular(0), 
                  width_:393,
                  height_: 95,
                  hex:const Color.fromARGB(255, 36, 36, 36),
                  onPressed:() 
                  { 
                    Navigator.push(context,MaterialPageRoute(builder:(context)
                    {
                      return const ParkingReservations();
                    },),);                  },
                  text: 'Parking Reservations',
                ),

                // const SizedBox(height: 10),

                MyButton
                (
                  circular:BorderRadius.circular(0), 
                  width_:393,
                  height_: 95,
                  hex:const Color.fromARGB(255, 36, 36, 36),
                  onPressed:() 
                  { 
                    Navigator.push(context,MaterialPageRoute(builder:(context)
                    {
                      return DevicePermissions();
                    },),);
                  },
                  text: 'Device Permissions',
                ),

                // const SizedBox(height: 10),

                MyButton
                (
                  circular:BorderRadius.circular(0), 
                  width_:393,
                  height_: 95,
                  hex:const Color.fromARGB(255, 36, 36, 36),
                  onPressed:() 
                  { 
                    Navigator.push(context,MaterialPageRoute(builder:(context)
                    {
                      return ResetPassword();
                    },),);                  },
                  text: 'Reset Password',
                ),

                // const SizedBox(height: 10),

                MyButton
                (
                  circular:BorderRadius.circular(0), 
                  width_:393,
                  height_: 95,
                  hex:const Color.fromARGB(255, 36, 36, 36),
                  onPressed:() 
                  { 
                    Navigator.push(context,MaterialPageRoute(builder:(context)
                    {
                      return PrivacyPolicy();
                    },),);                      },
                  text: 'Privacy Policy',
                ),

                // const SizedBox(height: 10),

                MyButton
                (
                  circular:BorderRadius.circular(0), 
                  width_:393,
                  height_: 95,
                  hex:const Color.fromARGB(255, 36, 36, 36),
                  onPressed:() 
                  { 
                    Navigator.push(context,MaterialPageRoute(builder:(context)
                    {
                      return TermsAndConditions();
                    },),);    
                  },
                  text: 'Terms And Conditions',
                ),


                // const SizedBox(height: 10),

                MyButton
                (
                  circular:BorderRadius.circular(0), 
                  width_:393,
                  height_: 75,
                  hex:const Color.fromARGB(255, 213, 120, 120),
                  onPressed:() 
                  { 
                    signUserOut();
                  },
                  text: 'Log Out',
                ),

                const SizedBox(height: 40),
              ],
            ), 
            
          ],
        ),
      ),





      // THIS IS FOR TESTING BELOW :
        // bottomNavigationBar: const GMenu(),



    );
    
  }

}