class AppConfig {
  AppConfig._();

  static late String _baseUrl;
  static String get baseUrl => _baseUrl;

  static late String _oneSignapAppId;
  static String get oneSignalAppId => _oneSignapAppId;

  static void init() {
    _baseUrl = "https://moomalpublication.com/wp-json/";
  }
}
