import 'package:flutter/material.dart';

import 'core/routes.dart';

void main() {
  runApp(MovieDBApp());
}

class MovieDBApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}
