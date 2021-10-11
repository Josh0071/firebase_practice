import 'package:firebase_practice/model/account_profile.dart';
import 'package:firebase_practice/model/feed_list.dart';
import 'package:firebase_practice/page/create_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'Account Page',
          style: TextStyle(color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.create),
          onPressed: () {
            print('눌림');
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => CreatePage(null!)));
          }),
      body: Column(
        children: [
          AccountProfile(),
          FeedList(),
        ],
      ),
    );
  }
}
