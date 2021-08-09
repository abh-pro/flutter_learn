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
  List<int> mapper = [];
  List<int> selected = [];
  int _indexMap=0;
  bool _inSelection = false;
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "floating button",
      home: Scaffold(
        appBar: AppBar(
          title: Text("App exist"),
          actions: <Widget>[
            IconButton(onPressed: (){setState(() {
              deleteTiles();
              });}, icon: selected.length>0 ? Icon(Icons.delete,color: Colors.white) : Icon(Icons.delete_outline,color: Colors.black))
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.start,
          children: data,
        )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              createListTile(context); //adding list create here
            });
          },
          child: const Icon(Icons.add_box_rounded),
          backgroundColor: Colors.black,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }


  void createListTile(BuildContext context){
    Text title = Text(_getRandomStrings());
    Text subtitle = Text(_getRandomStrings());
    int index = _indexMap;
    _indexMap += 1;
    data.add(
        ListTile(
            title: title,
            subtitle: subtitle,
            trailing: Icon(Icons.arrow_forward),
            leading: iconInSelection(index),
            onTap: (){

              if(_inSelection){
                setState(() {
                  selectTile(index);
                });
              }else{
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen(title,subtitle))
                );
              }
              print(index);
            },
          onLongPress: (){
              // call selection window
            setState(() {
              if(!_inSelection){
                _inSelection = true;
                // select function
                selectTile(index);
              }
            });

          },
        )
    );
    mapper.add(index);
  }

  String _getRandomStrings(){
    const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    const int len=5;
    var rand = Random();
    var llp = Iterable.generate(len,(_)=> chars.codeUnitAt(rand.nextInt(chars.length)));
    return String.fromCharCodes(llp);
  }

  void selectTile(int index){
    if(selected.contains(index)){
      selected.remove(index);
    }else {
      selected.add(index);
    }
    print(selected);
  }
  Icon iconInSelection(int index){
    if(_inSelection){
        return Icon(selected.contains(index) ? Icons.check_circle : Icons.check_circle_outline);
    }
    return Icon(Icons.account_circle_outlined);
  }

  void deleteTiles(){
    List<int> temp = [];
    if(selected.length>0){
      // selected.forEach((element) {temp.add(mapper.indexOf(element));});
      for(int llp=0;llp<selected.length;llp++){
        temp.add(mapper.indexOf(selected[llp]));
      }
      print("map");
      print(mapper);
      for(int i=0;i<temp.length;i++){
        data.removeAt(temp[i]);
        mapper.removeAt(temp[i]);
      }
      selected.clear();
      _inSelection = false;
    }
  }
}