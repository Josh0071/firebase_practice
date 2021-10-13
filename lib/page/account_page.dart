import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_practice/model/account_profile.dart';
import 'package:firebase_practice/model/feed_list.dart';
import 'package:firebase_practice/page/create_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AccountPage extends StatefulWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseFirestore user;

  AccountPage(this.user);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
                builder: (BuildContext context) => CreatePage(widget.user)));
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
