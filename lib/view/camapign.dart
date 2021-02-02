import 'package:flutter/material.dart';

class Campaign extends StatelessWidget {
  final String _query;

  Campaign(this._query);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'campaign page',
        ),
      ),
      body: Center(
        child: Text(_query),
      ),
    );
  }
}
