import 'package:firebase_practice/model/account_profile.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text('Account Page',
          style: TextStyle(color: Colors.black),),
      ),
      body: Column(
        children: [
          AccountProfile(),
          FeedList(),

        ],
      ),
    );
  }
}
