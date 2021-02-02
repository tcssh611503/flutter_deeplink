abstract class RoutePattern {
  RoutePattern();

  factory RoutePattern.shoppage(final String query) = RoutePatternExample1;

  factory RoutePattern.campaign(final String query) = RoutePatternExample2;

  factory RoutePattern.prod() = RoutePatternExample3;

  R when<R>(
      {final R Function(RoutePatternExample1 state) shoppage,
      final R Function(RoutePatternExample2 state) campaign,
      final R Function(RoutePatternExample3 state) prod}) {
    if (this is RoutePatternExample1) {
      return shoppage(this);
    } else if (this is RoutePatternExample2) {
      return campaign(this);
    } else if (this is RoutePatternExample3) {
      return prod(this);
    } else {
      throw StateError;
    }
  }
}

class RoutePatternExample1 extends RoutePattern {
  final String query;

  RoutePatternExample1(this.query);
}

class RoutePatternExample2 extends RoutePattern {
  final String query;

  RoutePatternExample2(this.query);
}

class RoutePatternExample3 extends RoutePattern {}
