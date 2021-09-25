import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_panther/addItemView/addItemView.dart';
import 'package:green_panther/blogPosts/BlogPostsView.dart';
import 'package:green_panther/cameraView/cameraView.dart';
import 'package:green_panther/homeView/homeView.dart';
import 'package:green_panther/models/item_model.dart';
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

 void navigateToBlogPosts(BuildContext context) {
   Navigator.push(
     context,
     MaterialPageRoute(builder: (context) => BlogPostsView()),
   );
 }

 void navigateToAddItem(BuildContext context) {
   Navigator.push(
     context,
     MaterialPageRoute(builder: (context) => AddItem()),
   );
 }

  void navigateToCameraView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CameraView()),
    );

  }




}