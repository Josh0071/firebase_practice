import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/page/create_page.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseFirestore user;

  SearchPage(this.user);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(
        'firebase practice',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    ), body: buildBody());
  }



  Widget buildBody() {
    print('search_page created');
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.collection('post').snapshots(),
          builder: (_, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            var items = snapshot.data?.documents ?? [];

            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildListItem(context, items[index]);
                });
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.create),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => CreatePage(widget.user)));
          }),
    );
  }

  Widget buildListItem(context, document) {
    return Hero(
      tag: document['photoUrl'],
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
          },
          child: Image.network(
            document['photoUrl'],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}