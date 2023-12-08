import 'package:flutter/material.dart';

import '../pages/counter_page.dart';

class OtherPage extends StatelessWidget {
  static const routeName = "/other_page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Other Page"),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              CounterPage.routeName,
              arguments: ModalRoute.of(context)?.settings.arguments as int,
            );
          },
          child: Text("Go to Counter Page"),
        ),
      ),
    );
  }
}
