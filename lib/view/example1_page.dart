import 'package:flutter/material.dart';

class Example1Page extends StatelessWidget {
  final String _query;

  Example1Page(this._query);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Example1',
        ),
      ),
      body: Center(
        child: Text(_query),
      ),
    );
  }
}
