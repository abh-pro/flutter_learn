import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final String _titleData,_subtitleData;

  Screen(this._titleData,this._subtitleData);

  @override
  Widget build(BuildContext context) {
    Widget subtitle = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  this._titleData,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  ),
                ),
              ),
              Text(
                this._subtitleData,
                style: TextStyle(
                    color: Colors.indigo[200]
                ),
              )
            ],
          ))
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context,false);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Detail Screen"),
        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context,true);
          },
              icon: Icon(Icons.delete))
        ],
      ),
      body: ListView(
        children: [
          Image.asset(
            'images/lake.jpg',
            width: 600,
            height: 300,
            fit: BoxFit.cover,
          ),
          subtitle
        ],
      ),
    );
  }
}

