import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:green_panther/registerView/registerController.dart';
import 'package:green_panther/utils/NavigationHelper.dart';

import 'package:green_panther/main.dart';
import 'package:green_panther/singleton.dart' as singleton;


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  RegisterController _controller = RegisterController();


  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }



  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(),

        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
          child: Container(
            height:MediaQuery.of(context).size.height *1,
            color: Colors.blue[500],
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      "Choose a method to register",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 28)
                  ),

                  SizedBox(height: 30),

                  Text(
                      "(More will be added in the future!)",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16)
                  ),


                  _buildTextField(emailController, Icons.account_circle, 'Email', false),

                  SizedBox(height: 20),

                  _buildTextField(passwordController, Icons.lock, "Password", true),

                  SizedBox(height: 30),


                  MaterialButton(
                      elevation: 0,
                      height: 50,
                      onPressed: () async {
                        User? firebaseUser;
                        final userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
                        firebaseUser = userCredential.user;
                        singleton.currentUser = firebaseUser;
                        _controller.writeUserData(emailController.text.trim(), singleton.currentUser!.uid);
                        print(firebaseUser?.email);
                        NavigationHelper().navigateToSignIn(context);
                      },

                      color: Colors.blue,

                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                                "Register",
                                style: TextStyle(color: Colors.white, fontSize: 20)
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ]
                      )

                  ),

                  SizedBox(height: 20),



                ]
            ),
          ),
        )
    );


  }



  _buildTextField(
      TextEditingController controller, IconData icon, String labelText, obscured) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height *
          0.025,),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color:  Colors.blue[200], border: Border.all(color: Colors.blue)),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        enableSuggestions: false,
        autocorrect: false,
        obscureText: obscured,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }
}
