import 'package:flutter/material.dart';
import 'package:flutter_localization_bloc_bug/pages/first_page.dart';
import 'package:flutter_localization_bloc_bug/pages/splash_page.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'splash_page':
        return MaterialPageRoute(builder: (_) => SplashPage());
      case 'first_page':
        return MaterialPageRoute(builder: (_) => FirstPage());
    }
  }

}