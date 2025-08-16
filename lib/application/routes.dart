import 'package:app/features/movie/presentation/pages/movies-page.dart';
import 'package:app/features/splash/presentation/pages/splash-page.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = {
    '/splash' : (context) => SplashPage(),
    '/movies' : (context) => LoginPage(),
  };
}

