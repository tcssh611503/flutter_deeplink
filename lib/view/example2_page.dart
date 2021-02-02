import 'package:flutter/material.dart';

class Example2Page extends StatelessWidget {
  final String _query;

  Example2Page(this._query);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Example2',
        ),
      ),
      body: Center(
        child: Text(_query),
      ),
    );
  }
}
