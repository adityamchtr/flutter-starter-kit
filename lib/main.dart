import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/app/modules/my_app.dart';
import 'package:flutter_starter_kit/flavors/build_config.dart';
import 'package:flutter_starter_kit/flavors/env.dart';
import 'package:flutter_starter_kit/flavors/env_config.dart';

void main() {
  EnvConfig envConfig = const EnvConfig(
    appName: "App Name",
    publicUrl: "",
    baseUrl: "",
    apiKey: "",
  );

  BuildConfig.instantiate(
      env: Env.prod,
      config: envConfig
  );

  runApp(const MyApp());
}
