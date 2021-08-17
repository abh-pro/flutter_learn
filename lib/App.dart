import 'package:flutter/material.dart';
import 'dart:math';
import 'screens.dart';


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List data = [];
  List<int> selected = [];
  bool _inSelection = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "floating button",
      home: Scaffold(
        appBar: AppBar(
          title: Text("App exist"),
          actions: <Widget>[
            selectAll(),
            unSelection(),
            Center(child: Text(retSelected(),style: TextStyle(fontSize: 20.0),textAlign: TextAlign.center)),
            IconButton(
                onPressed: () {
                  setState(() {
                    deleteTiles();
                  });
                },
                icon: selected.length > 0
                    ? Icon(Icons.delete, color: Colors.white)
                    : Icon(Icons.delete_outline, color: Colors.black)),
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          children: generateChildren(context),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              addIntoData(); //add data into data array
            });
          },
          child: const Icon(Icons.add_box_rounded),
          backgroundColor: Colors.black,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  Widget selectAll(){
    if(_inSelection){
      return IconButton(
        onPressed: (){
          setState(() {
            selected.clear();
            for(int i=0;i<data.length;i++){
              selected.add(i);
            }
          });

        },
        icon: Icon(Icons.check),
      );
    }
    return Text("");
  }

  Widget unSelection(){
    if(_inSelection){
      return IconButton(
          onPressed: () {
            setState(() {
              _inSelection = false;
              selected.clear();
            });
          },
          icon: Icon(Icons.clear)
      );
    }
    return Text("");
  }

  String retSelected(){
    if(_inSelection){
      if(selected.length > 0)
        return selected.length.toString();
    }
    return "";
  }

  void addIntoData() {
    data.add(new TileData(_getRandomStrings(), _getRandomStrings()));
  }

  List<Widget> generateChildren(BuildContext context) {
    if (data.length == 0) {
      return [];
    }

    List<Widget> returningList = [];
    for (int i = 0; i < data.length; i++) {
      TileData temp = data[i];
      returningList.add(ListTile(
        title: Text(temp.title),
        subtitle: Text(temp.subtitle),
        leading: iconInSelection(i),
        selectedTileColor: Colors.grey,
        selected: selected.contains(i),
        onTap: () {
          if (_inSelection) {
            setState(() {
              selectTile(i);
            });
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Screen(temp.title, temp.subtitle))).then((value) {
              setState(() {
                if (value)
                  data.removeAt(i);
              });
            });
          }
        },
        onLongPress: () {
          setState(() {
            if (!_inSelection) {
              _inSelection = true;
              // select function
              selectTile(i);
            }
          });
        },
      ));
    }
    return returningList;
  }

  String _getRandomStrings() {
    const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    const int len = 5;
    var rand = Random();
    var llp = Iterable.generate(
        len, (_) => chars.codeUnitAt(rand.nextInt(chars.length)));
    return String.fromCharCodes(llp);
  }

  void selectTile(int index) {
    if (selected.contains(index)) {
      selected.remove(index);
    } else {
      selected.add(index);
    }
  }

  Icon iconInSelection(int index) {
    if (_inSelection) {
      return Icon(selected.contains(index)
          ? Icons.check_circle
          : Icons.check_circle_outline);
    } else {
      return Icon(Icons.account_circle_outlined);
    }
  }

  void deleteTiles() {
    if (selected.length > 0) {
      //need to be modified
      for (int i = 0; i < selected.length; i++) {
        data[selected[i]] = null;
      }
      data.removeWhere((element) => element == null);
      selected.clear();
      _inSelection = false;
    }
  }
}

class TileData {
  late String title;
  late String subtitle;

  TileData(this.title, this.subtitle);
}
