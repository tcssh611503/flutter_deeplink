import 'dart:async';

import 'package:deep_link_flutter/viewmodel/route_pattern.rb.dart';
import 'package:uni_links/uni_links.dart';

class MainViewModel {
  final _routePatternController = StreamController<RoutePattern>();

  MainViewModel() {
    _loadNextRoute();
  }

  void dispose() {
    _routePatternController.close();
  }

  Stream<RoutePattern> get nextRoute => _routePatternController.stream;

  void _loadNextRoute() {
    getInitialUri().then((uri) {
      _streamRoutePattern(uri);
    });
    getUriLinksStream().listen((uri) {
      _streamRoutePattern(uri);
    });
  }

  void _streamRoutePattern(Uri uri) {
    if (uri != null) {
      switch (uri.host) {
        case 'example1':
          _routePatternController.sink.add(RoutePattern.example1(uri.query));
          break;
        case 'example2':
          _routePatternController.sink.add(RoutePattern.example2(uri.query));
          break;
        case 'example3':
          _routePatternController.sink.add(RoutePattern.example3());
          break;
      }
    }
  }
}
