import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController myController = TextEditingController();
  String hasil = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Text Field"), // AppBar
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: myController,
                  onChanged: (value) {
                    print("ONCHANGE");
                  },
                  onSubmitted: (value) {
                    print(value);
                    setState(() {
                      hasil = value;
                    });
                  },
                  onEditingComplete: () {
                    print("EDIT SUCCESS");
                    print(myController.text);
                  },
                ),
                Text(hasil),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
