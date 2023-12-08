import 'package:flutter/material.dart';

import './pages/counter_page.dart';

import './pages/other_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterPage(),
      routes: {
        CounterPage.routeName: (ctx) => CounterPage(),
        OtherPage.routeName: (ctx) => OtherPage(),
      },
    );
  }
}
