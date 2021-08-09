import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final String _titleData,_subtitleData;

  Screen(this._titleData,this._subtitleData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this._titleData),
      ),
      body: Text(this._subtitleData),
    );
  }
}
