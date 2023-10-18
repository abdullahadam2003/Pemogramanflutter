import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Tab> myTabs = [
    Tab(
      text: "Tab 1",
    ),
    Tab(
      text: "Tab 2",
      icon: Icon(Icons.ac_unit_outlined),
    ),
    Tab(
      text: "Tab 3",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        initialIndex: 2,
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("My Apps"),
            bottom: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.lightBlue,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(
                color: Colors.greenAccent,
              ),
              indicator: BoxDecoration(
                color: Colors.cyan,
                border: Border(
                  top: BorderSide(
                    color: Colors.greenAccent,
                    width: 5,
                  ),
                ),
              ),
              tabs: myTabs,
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text(
                  "Isi Tab 1",
                  style: TextStyle(fontSize: 40),
                ),
              ),
              Center(
                child: Text(
                  "Isi Tab 2",
                  style: TextStyle(fontSize: 40),
                ),
              ),
              Center(
                child: Text(
                  "Isi Tab 3",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
