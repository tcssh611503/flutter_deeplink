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
        case 'shoppage':
          print(uri);
          _routePatternController.sink.add(RoutePattern.shoppage(uri.query));
          break;
        case 'campaign':
           print(uri);
          _routePatternController.sink.add(RoutePattern.campaign(uri.query));
          break;
        case 'prod':
           print(uri);
          _routePatternController.sink.add(RoutePattern.prod());
          break;
      }
    }
  }
}
