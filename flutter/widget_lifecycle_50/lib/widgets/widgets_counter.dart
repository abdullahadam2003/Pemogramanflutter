import 'package:flutter/material.dart';

import '../pages/other_page.dart';

class WidgetCounter extends StatefulWidget {
  WidgetCounter({
    super.key,
    required this.counter,
  }) {
    print("-------------------------");
    print("constructor Widget");
  }

  final int counter;

  @override
  State<WidgetCounter> createState() {
    print("createState");
    return _WidgetCounterState();
  }
}

class _WidgetCounterState extends State<WidgetCounter> {
  @override
  void initState() {
    super.initState();
    print("initState()");
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies()");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant WidgetCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("old: ${oldWidget.counter}");
    print("didUpdateWidget()");
    print("new: ${widget.counter}");
  }

  @override
  void deactivate() {
    print("deactivate()");
    super.deactivate();
  }

  @override
  void dispose() {
    print("ddispose()");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build()");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${widget.counter}",
            style: TextStyle(
              fontSize: 35,
            ),
          ),
          SizedBox(height: 50),
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                OtherPage.routeName,
                arguments: widget.counter,
              );
            },
            child: Text("Go to Other Page"),
          ),
        ],
      ),
    );
  }
}
