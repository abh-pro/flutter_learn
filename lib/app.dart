import 'package:flutter/material.dart';
import 'screens.dart';
class App extends StatelessWidget{
  //  generate a basic int list here
  final int _length = 100;

  @override
  Widget build(BuildContext context) {

        return MaterialApp(
          title: "flutter-learn",
          home: Scaffold(
            appBar: AppBar(
              title: Text('flutter-learn'), // title added to app bar
            ),
            body: ListView.builder( //the list should appear here
              itemCount: _length,
              itemBuilder: (_,i){
                return _buildTile(context,i);
              },
            ),
          ),
        );
  }

  Widget _buildTile(BuildContext context,int i){
    return ListTile(
      title: Text("something"),
      subtitle: Text((i+1).toString()),
      trailing: Icon(Icons.arrow_forward),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Screen(i))
        );
      },
    );
  }
}