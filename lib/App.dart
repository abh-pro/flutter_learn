
import 'dart:async';

import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<int> test = [0,1,2,3];
  bool mode = true;
  bool _isClock = true;
  List<Color> _colorList = [Colors.red,Colors.blue,Colors.green,Colors.yellow];

  @override
  Widget build(BuildContext context) {

    TextStyle appBarContStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 17.0,
      letterSpacing: 1.5
    );
    TextStyle tapAppbarContStyle = TextStyle(
        color: mode ? Colors.white:Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 17.0,
        letterSpacing: 1.5
    );
    TextStyle timeAppbarContStyle = TextStyle(
        color: mode ? Colors.black : Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 17.0,
        letterSpacing: 1.5
    );


    return Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  constraints: BoxConstraints.expand(height: 50.0,width: getScreenWidth(context)-2),
                  margin: const EdgeInsets.fromLTRB(1, 31, 1, 5),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    border: Border.all(
                      color: Colors.white70,
                      width: 1
                    ),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100]
                        ),
                        constraints: BoxConstraints.expand(height: 35.0,width: 120.0),
                        margin: EdgeInsets.only(left: 10),
                        child: Center(
                            child: Text(
                              "Mode",
                              style: appBarContStyle,
                            )
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: mode ? Colors.blue[500] : Colors.grey[90]
                        ),
                        constraints: BoxConstraints.expand(height: 35.0,width: 120.0),
                        margin: EdgeInsets.only(left: 5),
                        child: Center(
                          child: TextButton(
                            child: Text(
                              "Tap",
                              style: tapAppbarContStyle,
                            ),
                            onPressed: (){
                              setState(() {
                                mode = true;
                              });

                            },

                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: mode ? Colors.grey[100] : Colors.blue[500]
                        ),
                        constraints: BoxConstraints.expand(height: 35.0,width: 120.0),
                        margin: EdgeInsets.only(left: 5),
                        child: Center(
                          child: TextButton(
                            child: Text(
                              "Time",
                              style: timeAppbarContStyle,
                            ),
                            onPressed: (){
                              setState(() {
                                mode = false;
                                rotateOnTime(Duration(seconds: 1));
                              });
                            },

                          ),
                        ),
                      )

                    ],
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.start,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // the boxes
                        retColorBox(_colorList[0]),
                        retColorBox(_colorList[1])
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // the boxes
                        retColorBox(_colorList[3]),
                        retColorBox(_colorList[2])
                      ],
                    )
                  ],
                ),
                Center(
                  child: SizedBox(
                    height: 92,
                    width: 92,
                    child: IconButton(
                      icon: Image(
                        image: _isClock ? AssetImage("images/reload.png") : AssetImage("images/reloadflipped.png"),
                      ),
                      onPressed: (){
                        setState(() {
                          _isClock = !_isClock;
                        });

                      },
                    )
                  ),
                )
              ],
            )
          ],
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      );
  }

  double getScreenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  Widget retColorBox(Color coled){
    return SizedBox(
      width: 190,
      height: 360,
      child: ColoredBox(
        color: coled,
        child: TextButton(
          child: Text(""),
          onPressed: (){
            if(mode){
              setState(() {
                rotateList();
              });
            }
          },
        ),
      )
    );
  }

  void rotateOnTime(Duration duration){
      Timer.periodic(duration, (timer) {
        if(mode){
          timer.cancel();
        }
        setState(() {
          rotateList();
        });

      });
  }

  void rotateList(){
    List<Color> temp1 = _colorList;
    if(_isClock){
      Color temp = temp1[temp1.length-1];
      for(int i=0;i<4;i++){
          Color t = temp1[i];
          temp1[i] = temp;
          temp = t;

      }
      _colorList = temp1;
    }
    else{
      Color temp = temp1[0];
      for(int i=0;i<temp1.length;i++){
        if(temp1.length-1 == i){
          _colorList[i] = temp;
        }else {
          _colorList[i] = temp1[(i + 1) % temp1.length];
        }
      }
    }
  }
}