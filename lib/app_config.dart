
import 'utils/globals.dart';

abstract class AppConfig {
  static String baseUrl;
  static String oneSignalAppId;

  static setupEnv(Environment env) {
    switch (env) {
      case Environment.dev:
        {
          AppConfig.baseUrl = url;
          AppConfig.oneSignalAppId = "be4fd6b5-76c0-4cd1-9a04-364e18db889c";
          break;
        }

      case Environment.stage:
        {
          AppConfig.baseUrl = url;
          AppConfig.oneSignalAppId = "be4fd6b5-76c0-4cd1-9a04-364e18db889c";
          break;
        }

      case Environment.prod:
        {
          AppConfig.baseUrl = url;
          AppConfig.oneSignalAppId = "be4fd6b5-76c0-4cd1-9a04-364e18db889c";
        }
    }
  }
}

enum Environment { dev, stage, prod }
