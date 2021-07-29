import 'package:flutter/material.dart';
class App extends StatelessWidget{
  //  generate a basic int list here
  final data = List<int>.generate(6, (index) => index);

  @override
  Widget build(BuildContext context) {

        return MaterialApp(
          title: "flutter-learn",
          home: Scaffold(
            appBar: AppBar(
              title: Text('flutter-learn'), // title added to app bar
            ),
            body: ListView.builder( //the list should appear here
              itemCount: data.length,
              itemBuilder: (context,i){
                return _buildTile(i);
              },
            ),
          ),
        );
  }

  Widget _buildTile(int i){
    return ListTile(
      title: Text("something"),
      subtitle: Text((i+1).toString()),
    );
  }
}