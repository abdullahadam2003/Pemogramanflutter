import 'package:flutter/material.dart';

import '../widgets/widgets_counter.dart';

class CounterPage extends StatefulWidget {
static const routeName = "/counter-page";

  CounterPage(){
    print("===========================");
    print("constructor Counter Page");

  }
  @override
  _CounterPageState createState(){  
    return _CounterPageState();
  }
} 

class CounterPageState extends State<CounterPage>{
  int counter =0;

  @override
  void didChangeDependencies() {
    int numberState = ModalRoute.of(context)?.settings.arguments as int;
    if(numberState != null){
      print("Nilai telah dikembalikan seperti state terakhir");
      counter = numberState;
    }
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Page"),
      ),
      body: WidgetCounter(counter: counter),
      floatingActionButton: FloatingActionButton{
        onPressed: (){
          setState(() {
            counter++;
          });
        },
        child: Icon(Icon.add),
      },
    );
  }
}

