
import 'package:flutter/widgets.dart';
import 'package:flutter_moviedbapp/ui/home/home_screen.dart';
import 'package:flutter_moviedbapp/ui/home/movie_detail_screen.dart';

class AppRoutes {
  static String initialRoute = HomeScreen.routeName;

  static final routes = {
    HomeScreen.routeName: (BuildContext context) => HomeScreen(),
    MovieDetailScreen.routeName: (BuildContext context) => MovieDetailScreen(),
  };
}