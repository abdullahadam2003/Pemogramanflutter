import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.amber,
        primaryColor: Color(0xff5D4524),
        primaryColorDark: Colors.green,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.red,
            fontFamily: "ShadowsIntoLight-Regular",
          ),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.red,
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "This is a text.",
              style: TextStyle(
                fontSize: 35,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "This is a text.",
              style: TextStyle(
                fontSize: 35,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text("Button"),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(
                    fontSize: 35,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.mediation),
      ),
    );
  }
}
