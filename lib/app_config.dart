class AppConfig {
  AppConfig._();

  static late String _baseUrl;
  static String get baseUrl => _baseUrl;

  static void init() {
    _baseUrl = "https://moomalpublication.com/wp-json/";
  }
}
