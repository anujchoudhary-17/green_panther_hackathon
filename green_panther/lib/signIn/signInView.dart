import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_panther/utils/NavigationHelper.dart';
import 'package:green_panther/singleton.dart' as singleton;
import '../main.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {

  _buildTextField(
      TextEditingController controller, IconData icon, String labelText, obscured) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height *
          0.025,),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.blue[200], border: Border.all(color: Colors.blue)),
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

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),

        body: Container(
          color: Colors.blue[500],
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    "Choose a method to sign in",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 28)
                ),

                SizedBox(height: 30),

                Text(
                    "(More will be added in the future!)",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16)
                ),

                SizedBox(height: 30),

                _buildTextField(emailController, Icons.account_circle, 'Email', false),

                SizedBox(height: 20),

                _buildTextField(passwordController, Icons.lock, "Password", true),

                SizedBox(height: 30),


                GestureDetector(
                  onTap: () async {
                    User? firebaseUser;
                    final userCredential = await firebaseAuth
                        .signInWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim()
                    );
                    firebaseUser = userCredential.user;
                    singleton.currentUser = firebaseUser;
                    print(firebaseUser?.email);
                    NavigationHelper().navigateToHome(context);

                  },
                  child: Text("Sign In",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),

                ),

                SizedBox(height: 20),

              ]
          ),
        )
    );
  }
}
