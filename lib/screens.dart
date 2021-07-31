import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final Text _titleData,_subtitleData;

  Screen(this._titleData,this._subtitleData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: this._titleData,
      ),
      body: this._subtitleData,
    );
  }
}
