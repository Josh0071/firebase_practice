import 'package:firebase_practice/page/first_page.dart';
import 'package:firebase_practice/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GoogleSignInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget GoogleSignInButton() {
    return SignInButton(Buttons.Google, onPressed: () {
      signInWithGoogle().then((result) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return FirstPage();
            },
          ),
        );
      });
    },);
  }
}
