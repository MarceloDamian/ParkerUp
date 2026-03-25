import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/register_page.dart';

// download extension that helps create boilerplate dart code

class LoginOrRegisterPage extends StatefulWidget
{
  const LoginOrRegisterPage({super.key});
  
  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPage();
}

class _LoginOrRegisterPage extends State<LoginOrRegisterPage>
{

  //initally show login page

  bool showLoginPage = true;
  // toggle between login and register page 

  void togglePages()
  {
    setState
    (()
      {
        showLoginPage = !showLoginPage;
      }
    );
  }



  @override

  Widget build(BuildContext context)
  {
    if (showLoginPage)
    {
      return LoginPage
      (
        onTap: togglePages ,
      );
    }
    else 
    {
      return RegisterPage
      (
        onTap: togglePages,
      );
    }
  }
}