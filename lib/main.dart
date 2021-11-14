// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:rxdartproject/Mainbloc.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//hello
class _MyHomePageState extends State<MyHomePage> {
  Mainbloc mainbloc = Mainbloc();
  late int i;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StreamBuilder<bool>(
            stream: mainbloc.iconStateController,
            builder: (context, snapshot) {
              return InkWell(
                onTap: () {
                  mainbloc.changeState();
                },
                child: Icon(
                  snapshot.data == true ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                ),
              );
            },
          ),
          StreamBuilder(
            stream: mainbloc.counterController,
            builder: (context, snapshot) {
              return Text(snapshot.data.toString());
            },
          ),
          ElevatedButton(
            onPressed: () {
              mainbloc.increment();
            },
            child: Text("Increment"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Decrement"),
          ),
        ],
      ),
    );
  }
}
