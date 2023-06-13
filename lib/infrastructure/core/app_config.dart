
enum Environment { mock, dev, uat, prod }

class AppConfig {
  static late Map<String, dynamic> _config;
  static late Environment _currentEnvironment;
  static void setEnvironment(Environment env) {
    _currentEnvironment = env;
    switch (env) {
      case Environment.mock:
        _config = _Config.mockConfigs;
        break;

      case Environment.dev:
        _config = _Config.devConfigs;
        break;

      case Environment.uat:
        _config = _Config.uatConfigs;
        break;
      case Environment.prod:
        _config = _Config.prodConfigs;
        break;
    }
  }

  static get serverUrl {
    return _config[_Config.serverUrl];
  }

  static get protocol {
    return _config[_Config.protocol];
  }

  static get apiBaseUrl {
    return _config[_Config.protocol] + '://' + _config[_Config.serverUrl];
  }

  static get isMockEnvironment {
    return _currentEnvironment == Environment.mock;
  }

  static get isDevEnvironment {
    return _currentEnvironment == Environment.dev;
  }

  static get isUATEnvironment {
    return _currentEnvironment == Environment.uat;
  }

  static get isProdEnvironment {
    return _currentEnvironment == Environment.prod;
  }

  static get currentEnvironment {
    return _currentEnvironment;
  }
}

class _Config {
  static const serverUrl = "SERVER_URL";
  static const protocol = "PROTOCOL";

  static Map<String, dynamic> mockConfigs = {
    serverUrl: "mockurl.com",
    protocol: "https",
  };

  static Map<String, dynamic> devConfigs = {
    serverUrl: "dev.com",
    protocol: "https",
  };

  static Map<String, dynamic> uatConfigs = {
    serverUrl: "uat.com",
    protocol: "https",
  };

  static Map<String, dynamic> prodConfigs = {
    serverUrl: "prod.com",
    protocol: "https",
  };
}
