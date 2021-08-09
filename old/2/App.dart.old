import 'package:flutter/material.dart';
import 'dart:math';
import 'screens.dart';
// List<Widget> data = [];

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App>{
  List<Widget> data = [];
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "floating button",
      home: Scaffold(
        appBar: AppBar(
          title: Text("App exist"),
        ),
        body: Column(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.start,
          children: data,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            createListTile(context); //adding list create here

          },
          child: const Icon(Icons.add_box_rounded),
          backgroundColor: Colors.black,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      ),
    );
  }


  void createListTile(BuildContext context){
    Text title = Text(_getRandomStrings());
    Text subtitle = Text(_getRandomStrings());
    data.add(
        ListTile(
            title: title,
            subtitle: subtitle,
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.account_circle_outlined),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Screen(title,subtitle))
              );
            }
        )
    );
    setState(() {
    });
  }

  String _getRandomStrings(){
    const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    const int len=5;
    var rand = Random();
    var llp = Iterable.generate(len,(_)=> chars.codeUnitAt(rand.nextInt(chars.length)));
    return String.fromCharCodes(llp);
  }
}