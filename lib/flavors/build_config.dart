import 'package:flutter_starter_kit/flavors/env.dart';
import 'package:flutter_starter_kit/flavors/env_config.dart';

class BuildConfig {
  late final Env env;
  late final EnvConfig config;
  bool _lock = false;

  BuildConfig._internal();

  static final BuildConfig instance = BuildConfig._internal();

  factory BuildConfig.instantiate({
    required Env env,
    required EnvConfig config,
  }) {
    if (instance._lock) return instance;

    instance.env = env;
    instance.config = config;
    instance._lock = true;

    return instance;
  }
}