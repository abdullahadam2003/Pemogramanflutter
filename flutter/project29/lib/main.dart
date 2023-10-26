import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MyAppBar = AppBar(
      title: Text("Media Query"),
    );

    final bodyHeight = MediaQueryHeight -
        MyAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final bool islandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar: MyAppBar,
      body: Center(
        child: (islandscape)
            ? Column(
                children: [
                  Container(
                    height: bodyHeight * 0.5,
                    width: MediaQueryWidth,
                    color: Colors.amber,
                  ),
                  Container(
                    height: bodyHeight * 0.5,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2),
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return GridTile(
                          child: Container(
                            color: Color.fromARGB(255, Random().nextInt(156),
                                Random().nextInt(156), Random().nextInt(156)),
                          ),
                        );
                      },
                    ),
                  )
                ],
              )
            : Column(
                children: [
                  Container(
                    height: bodyHeight * 0.3,
                    width: MediaQueryWidth,
                    color: Colors.amber,
                  ),
                  Container(
                    height: bodyHeight * 0.7,
                    color: Colors.red,
                    child: ListView.builder(
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(),
                          title: Text("Hallo Semua.. "),
                        );
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
