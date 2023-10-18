import 'package:flutter/material.dart';
import 'package:project23/pages/gallery_page.dart';
import './gallery_page.dart';

class HomePage extends StatelessWidget {
  static const String nameRoute = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Center(
        child: Text(
          "HOME PAGE",
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/gallery');
        },
        child: Icon(Icons.arrow_right_alt),
      ),
    );
  }
}
