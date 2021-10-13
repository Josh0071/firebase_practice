import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_practice/page/account_page.dart';
import 'package:firebase_practice/page/home_page.dart';
import 'package:firebase_practice/page/search_page.dart';
import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseFirestore user;

  TabPage(this.user);

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _index = 0;
  List _pages = [
    HomePage(),SearchPage(widget.user),AccountPage(widget.user),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black87,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                  width: 32, height: 30, child: Icon(Icons.home_filled)),
              label: 'home'),
          BottomNavigationBarItem(
              icon: Container(width: 32, height: 29, child: Icon(Icons.search)),
              label: 'search'),
          BottomNavigationBarItem(
              icon: Container(
                  width: 32,
                  height: 32,
                  child: Icon(Icons.sentiment_satisfied)),
              label: 'profile'),
        ],
      ),
    );
  }
}
