class AppConfig {
  AppConfig._();

  static late String _baseUrl;
  static String get baseUrl => _baseUrl;

  static late String _consumerKey;
  static String get consumerKey => _consumerKey;

  static late String _consumerSecret;
  static String get consumerSecret => _consumerSecret;

  static void init() {
    _baseUrl = "https://moomalpublication.com/wp-json/";
    _consumerKey = "ck_0d68ec5d46979420eb3fe93eb254632ccf34a8d4";
    _consumerSecret = "cs_e2959e16b6e59b584f94b97fa8a731f8d562962c";
  }
}
