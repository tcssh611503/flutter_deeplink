import 'package:deep_link_flutter/view/example1_page.dart';
import 'package:deep_link_flutter/view/example2_page.dart';
import 'package:deep_link_flutter/view/example3_page.dart';
import 'package:deep_link_flutter/viewmodel/main_viewmodel.dart';
import 'package:deep_link_flutter/viewmodel/route_pattern.rb.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _mainViewModel = MainViewModel();

  @override
  void initState() {
    super.initState();

    _mainViewModel.nextRoute.listen((routePattern) {
      Navigator.push(context, _nextPageRoute(routePattern));
    });
  }

  @override
  void dispose() {
    _mainViewModel.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Main',
        ),
      ),
      body: Container(),
    );
  }

  Route _nextPageRoute(RoutePattern routePattern) {
    Widget page;
    routePattern.when(
      example1: (pattern) => page = Example1Page(pattern.query),
      example2: (pattern) => page = Example2Page(pattern.query),
      example3: (pattern) => page = Example3Page(),
    );
    return MaterialPageRoute(builder: (context) => page);
  }
}
