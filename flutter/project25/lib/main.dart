import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool statusSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey,
            // height: 1000,
            // width: 1000,
            child: Switch.adaptive(
              activeColor: Colors.amber,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.indigo,
              activeThumbImage: AssetImage("images/true.jpeg"),
              inactiveThumbImage: AssetImage("images/false.jpeg"),
              inactiveTrackColor: Colors.red,
              value: statusSwitch,
              onChanged: (value) {
                setState(() {
                  statusSwitch = !statusSwitch;
                });
                print(statusSwitch);
              },
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            (statusSwitch == true) ? "Switch on" : "Switch off",
            style: TextStyle(
              fontSize: 35,
            ),
          )
        ],
      )),
    );
  }
}
