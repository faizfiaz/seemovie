class EnvironmentConfig {
  static EnvName envName = EnvName.values.byName(const String.fromEnvironment('ENV_NAME', defaultValue: 'staging'));
  static String apiUrl = const String.fromEnvironment('API_URL');
  static String apiKey = const String.fromEnvironment('API_KEY');
  static String readToken = const String.fromEnvironment('READ_TOKEN');
}

enum EnvName { staging, production }
