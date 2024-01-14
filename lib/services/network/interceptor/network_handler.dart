import 'package:dio/dio.dart' as dio;
// import 'package:get/get.dart' as getx;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/network/dio_client.dart';
import 'package:moomalpublication/services/storage/shared_preferences_helper.dart';

mixin NetworkHandlingMixin {
  Future<void> handleErrorResponse(
    dio.DioException error,
    dio.ErrorInterceptorHandler handler,
  ) async {
    final int? statusCode = error.response?.statusCode;

    switch (statusCode) {
      case 400:
        showSnackBar(AppConstants.badRequest);
        break;

      case 401:
        await handleUnauthorized(error, handler);
        break;

      case 403:
        await handleUnauthorized(error, handler);
        break;

      case 404:
        showSnackBar(AppConstants.pageNotFound);
        break;

      case 405:
        showSnackBar(AppConstants.methodNotAllowed);
        break;

      case 408:
        showSnackBar(AppConstants.requestTimeout);
        break;

      case 500:
        showSnackBar(AppConstants.internalServerError);
        break;

      case 502:
        showSnackBar(AppConstants.badGateway);
        break;

      case 503:
        showSnackBar(AppConstants.serviceUnavailable);
        break;

      case 504:
        showSnackBar(AppConstants.gatewayTimeout);
        break;

      default:
        showSnackBar(AppConstants.somethingWentWrong);
    }
  }

  Future<void> handleUnauthorized(
    dio.DioException error,
    dio.ErrorInterceptorHandler handler,
  ) async {
    SharedPreferencesHelper.clearSharedPref();
    AppRouting.offAllNamed(NameRoutes.splashScreen);

    /** 
     * Retry the previous request
      if (getx.Get.find<InternetConnectivityController>().haveInternetConnection.value) {
        try {
          final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!.post(ApiPaths.token, data: data);

          final parsedResponse = TokenResponseData.fromJson(
            response.data! as Map<String, dynamic>,
          );

          // Save token to shared pref.
          await SharedPreferencesHelper.setValue(SharedPreferenceKeys.token, parsedResponse.token);

          // Init dio with auth
          DioClient.initWithAuth();

          return handler.resolve(await _retry(error.requestOptions, parsedResponse.token ?? ""));
        } on dio.DioException catch (_) {
          return handler.next(error);
        }
      } else {
        return handler.next(error);
      }
    */
  }

  void printResponse(dio.Response<dynamic> response) {
    if (kDebugMode) {
      print("*************************************** Response *************************************** ");

      // Print the response status code
      print('Status Code: ${response.statusCode}');

      // Print the response data
      print('Response Data: ${response.data}');

      // Response headers
      print('Response Headers');
      response.headers.map.forEach((key, value) {
        print("$key ----> $value");
      });
    }
  }

  void printRequest(dio.RequestOptions options) {
    if (kDebugMode) {
      print("*************************************** Request *************************************** ");

      // Print the request method (GET, POST, etc.)
      print('Request Method: ${options.method}');

      // Print the request URL
      print('Request URL: ${options.uri}');

      // Print the request data if it's available (e.g., for POST requests)
      if (options.data != null) {
        print('Request Data: ${options.data}');
      }

      // Request headers
      print('Request Headers');
      options.headers.map((key, value) {
        print("$key ----> $value");
        return MapEntry(key, value);
      });
    }
  }

  Future<Response<dynamic>> _retry(
    RequestOptions requestOptions,
    String accessToken,
  ) {
    final options = Options(
      method: requestOptions.method,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    return DioClient.dioWithAuth!.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
