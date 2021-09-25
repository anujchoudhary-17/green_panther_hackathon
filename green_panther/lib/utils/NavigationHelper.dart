import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_panther/homeView/homeView.dart';
import 'package:green_panther/registerView/registerView.dart';
import 'package:green_panther/signIn/signInView.dart';


class NavigationHelper{

 void navigateToSignIn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignInView()),
    );
  }
 void navigateToRegister(BuildContext context) {
   Navigator.push(
     context,
     MaterialPageRoute(builder: (context) => Register()),
   );
 }

  void navigateToHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeView()),
    );
  }




}