import 'package:dio/dio.dart';
import 'package:moomalpublication/config/app_config.dart';
import 'package:moomalpublication/services/storage/shared_preferences_helper.dart';
import 'package:moomalpublication/services/storage/shared_preferences_keys.dart';
import 'interceptor/network_interceptor.dart';

class DioClient {
  DioClient._();

  static late Dio? _dioWithAuth;
  static Dio? get dioWithAuth {
    if (_dioWithAuth == null) {
      initWithAuth();
    }

    return _dioWithAuth;
  }

  static late Dio? _dioWithoutAuth;
  static Dio? get dioWithoutAuth {
    if (_dioWithoutAuth == null) {
      initWithoutAuth();
    }

    return _dioWithoutAuth;
  }

  static BaseOptions? _options;
  static BaseOptions? get options => _options;

  static void init() {
    // Init base options
    initBaseOption();

    // Init dio without auth
    initWithoutAuth();
  }

  static Future<void> initWithAuth() async {
    _dioWithAuth = createDio();
    _dioWithAuth!.options.headers = await getHeaders();
    _dioWithAuth!.interceptors.add(NetworkInterceptor());
  }

  static void initWithoutAuth() {
    _dioWithoutAuth = createDio();
    _dioWithoutAuth!.interceptors.add(NetworkInterceptor());
  }

  static Future<Map<String, String>> getHeaders({String? authToken}) async {
    authToken ??= await SharedPreferencesHelper.getString(
      SharedPreferenceKeys.token,
    );

    return {
      "Authorization": "Bearer $authToken",
    };
  }

  static Dio createDio({String? baseUrl}) {
    initBaseOption(baseUrl: baseUrl);
    final Dio dio = Dio(_options);
    return dio;
  }

  static void initBaseOption({String? baseUrl}) {
    _options = BaseOptions(
      baseUrl: baseUrl ?? AppConfig.baseUrl,
      connectTimeout: const Duration(milliseconds: 1000 * 120),
      receiveTimeout: const Duration(milliseconds: 12000),
      receiveDataWhenStatusError: true,
      contentType: Headers.jsonContentType,
    );
  }
}
