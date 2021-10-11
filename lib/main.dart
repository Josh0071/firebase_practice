import 'package:firebase_practice/page/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Firebase Practice',
        theme: ThemeData(
          primaryColor: Colors.white,
          brightness: Brightness.light,
          /* light theme settings */
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: LoginPage(), );
  }
}
