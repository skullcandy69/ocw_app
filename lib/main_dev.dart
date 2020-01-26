import 'package:flutter/material.dart';
import 'package:ocw_app/utils/globals.dart';

import 'app_config.dart';
import 'main.dart';

void main() {
  AppConfig.setupEnv(Environment.dev);
  setupLocator();
  runApp(OlaCarWash());
}
