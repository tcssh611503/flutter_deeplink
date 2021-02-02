import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  final String _query;

  ShopPage(this._query);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'shopPage',
        ),
      ),
      body: Center(
        child: Text(_query),
      ),
    );
  }
}
