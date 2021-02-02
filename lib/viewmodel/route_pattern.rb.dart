abstract class RoutePattern {
  RoutePattern();

  factory RoutePattern.example1(final String query) = RoutePatternExample1;

  factory RoutePattern.example2(final String query) = RoutePatternExample2;

  factory RoutePattern.example3() = RoutePatternExample3;

  R when<R>(
      {final R Function(RoutePatternExample1 state) example1,
      final R Function(RoutePatternExample2 state) example2,
      final R Function(RoutePatternExample3 state) example3}) {
    if (this is RoutePatternExample1) {
      return example1(this);
    } else if (this is RoutePatternExample2) {
      return example2(this);
    } else if (this is RoutePatternExample3) {
      return example3(this);
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
