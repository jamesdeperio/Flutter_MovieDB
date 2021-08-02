import 'package:flutter/material.dart';
import 'package:flutter_moviedbapp/application.dart';
import 'core/api/APIService.dart';
import 'flavors.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

Future main() async {
  await DotEnv.load(fileName: ".env");
  F.appFlavor = Flavor.STAGING;
  APIService.baseUrl = DotEnv.env['BASE_URL_STAGING'];
  APIService.apiKey = 'api_key=${DotEnv.env['API_KEY_STAGING']}';

  runApp(MovieDBApp());
}
