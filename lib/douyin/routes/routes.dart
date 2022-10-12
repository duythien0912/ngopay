import 'package:flutter/cupertino.dart';
import 'package:ngopay/douyin/page/splash/splash_page.dart';

import 'package:ngopay/douyin/page/error/not_find_page.dart';

final Map<String, WidgetBuilder> _routes = <String, WidgetBuilder>{
  '/': (BuildContext context) => SplashPage(),
  './': (BuildContext context) => SplashPage(),
};

Map<String, WidgetBuilder> get routes => _routes;

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final builder = routes[settings.name];
    return CupertinoPageRoute<dynamic>(
      builder: builder ?? (BuildContext context) => const NotFindPage(),
    );
  }
}
