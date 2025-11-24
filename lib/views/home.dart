import 'package:calculator/logic/operations.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Simple Calculator",)),titleTextStyle: TextStyle(color: Colors.blueGrey,),
        backgroundColor: Colors.cyan,
      ),
      body: Operation(),
   )      ;
  }
}
