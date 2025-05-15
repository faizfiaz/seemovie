class EnvironmentConfig {
  static EnvName envName = EnvName.values.byName(const String.fromEnvironment('ENV_NAME', defaultValue: 'staging'));
}

enum EnvName { staging, production }
