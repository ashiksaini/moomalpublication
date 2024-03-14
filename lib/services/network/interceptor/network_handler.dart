import 'package:dio/dio.dart' as dio;
// import 'package:get/get.dart' as getx;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/utils/toast.dart';import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/logger/custom_logger.dart';
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
        {
          showToast(AppConstants.badRequest);
          handler.next(error);
        }
        break;

      case 401:
        {
          await handleUnauthorized(error, handler);
          handler.next(error);
        }
        break;

      case 403:
        {
          await handleUnauthorized(error, handler);
          handler.next(error);
        }
        break;

      case 404:
        {
          showToast(AppConstants.pageNotFound);
          handler.next(error);
        }
        break;

      case 405:
        {
          showToast(AppConstants.methodNotAllowed);
          handler.next(error);
        }
        break;

      case 408:
        {
          showToast(AppConstants.requestTimeout);
          handler.next(error);
        }
        break;

      case 500:
        {
          showToast(AppConstants.internalServerError);
          handler.next(error);
        }
        break;

      case 502:
        {
          showToast(AppConstants.badGateway);
          handler.next(error);
        }
        break;

      case 503:
        {
          showToast(AppConstants.serviceUnavailable);
          handler.next(error);
        }
        break;

      case 504:
        {
          showToast(AppConstants.gatewayTimeout);
          handler.next(error);
        }
        break;

      default:
        {
          showToast(AppConstants.somethingWentWrong);
          handler.next(error);
        }
    }
  }

  Future<void> handleUnauthorized(
    dio.DioException error,
    dio.ErrorInterceptorHandler handler,
  ) async {
    SharedPreferencesHelper.clearSharedPrefExcept();
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
      CustomLogger.logger.w(
          "*************************************** Response ***************************************\n"
          "Status Code: ${response.statusCode}\n"
          "Url: ${response.requestOptions.uri}\n"
          "Response Data: ${response.data}\n"
          "Response Headers:\n"
          "${response.headers.map.entries.map((entry) => "${entry.key} ----> ${entry.value}").join('\n')}");
    }
  }

  void printRequest(dio.RequestOptions options) {
    if (kDebugMode) {
      CustomLogger.logger.w(
          "*************************************** Request ***************************************\n"
          "Request Method: ${options.method}\n"
          "Request URL: ${options.uri}\n"
          "Request Data: ${options.data ?? 'No data'}\n"
          "Request Headers:\n"
          "${options.headers.entries.map((entry) => "${entry.key} ----> ${entry.value}").join('\n')}");
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
