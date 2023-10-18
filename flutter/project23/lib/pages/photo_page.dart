import 'package:flutter/material.dart';

class photoPage extends StatelessWidget {
  static const nameRoute = '/photopage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("photoPage"),
        // leading: Container(),
      ),
      body: Center(
          child: Text(
        "PHOTO PAGE",
        style: TextStyle(
          fontSize: 50,
        ),
      )),
    );
  }
}
