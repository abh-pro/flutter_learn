import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final int _index;
  Screen(this._index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example $_index'),
      ),
      body: Text('example $_index'),
    );
  }
}
