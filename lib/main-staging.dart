import 'package:flutter/material.dart';
import 'package:flutter_moviedbapp/application.dart';
import 'core/api/APIService.dart';
import 'flavors.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

Future main() async {
  var env = await DotEnv.load(fileName: "config.env");
  F.appFlavor = Flavor.STAGING;
  APIService.baseUrl = env['BASE_URL_${Flavor.STAGING}'];
  APIService.apiKey = 'api_key=${env['API_KEY_${Flavor.STAGING}']}';

  runApp(MovieDBApp());
}
