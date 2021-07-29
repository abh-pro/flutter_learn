import 'package:flutter/material.dart';
class App extends StatelessWidget{
  //  generate a bsic int list here
  final data = List<int>.generate(6, (index) => index);

  @override
  Widget build(BuildContext context) {

        return MaterialApp(
          title: "flutter-learn",
          home: Scaffold(
            appBar: AppBar(
              title: Text('flutter-learn'), // title added to app bar
            ),
            body: ListView( //the list should appear here

            ),
          ),
        );
  }
}