import 'package:flutter/material.dart';
import 'package:flutter_moviedbapp/application.dart';
import 'package:flutter_moviedbapp/core/api/APIService.dart';

import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.PRODUCTION;
  APIService.baseUrl ='https://api.themoviedb.org/3';
  APIService.apiKey = 'api_key=b0fbe003fb2b4f037917ba2e46d27827';

  runApp(MovieDBApp());
}
