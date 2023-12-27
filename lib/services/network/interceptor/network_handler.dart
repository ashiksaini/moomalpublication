import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
// import 'package:get/get.dart' as getx;
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/services/network/dio_client.dart';

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
        // await handleUnauthorized(error, handler);
        break;

      case 403:
        showSnackBar(AppConstants.forbidden);
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

  // Future<void> handleUnauthorized(
  //   dio.DioException error,
  //   dio.ErrorInterceptorHandler handler,
  // ) async {
  //     final LoginResponse loginResponse = await getNewAccessToken();
  //     if (loginResponse.data != null &&
  //         loginResponse.data!.statusCode == AppConstants.successGetStatusCode) {
  //       final String newAccessToken = loginResponse.data!.data!.access!;
  //       final String newRefreshToken = loginResponse.data!.data!.refresh!;
  //       Utility.saveLoginDataToLocal(newAccessToken, newRefreshToken);
  //       DioClient.initWithAuth();
  //       return handler
  //           .resolve(await _retry(error.requestOptions, newAccessToken));
  //     } else if (loginResponse.data == null ||
  //         loginResponse.data!.statusCode ==
  //             AppConstants.unauthorized401StatusCode) {
  //       SharedPreferencesHelper.clearSharedPref();
  //       AppRouting.offAllNamed(NameRoutes.splashScreen);
  //       return handler.next(error);
  //     }
  //     return handler.next(error);
  // }

  void printResponse(dio.Response<dynamic> response) {
    if (kDebugMode) {
      print(
          "*************************************** Response *************************************** ");

      // Print the response status code
      print('Status Code: ${response.statusCode}');

      // Print the response data
      print('Response Data: ${response.data}');
    }
  }

  void printRequest(dio.RequestOptions options) {
    if (kDebugMode) {
      print(
          "*************************************** Request *************************************** ");

      // Print the request method (GET, POST, etc.)
      print('Request Method: ${options.method}');

      // Print the request URL
      print('Request URL: ${options.uri}');

      // Print the request data if it's available (e.g., for POST requests)
      if (options.data != null) {
        print('Request Data: ${options.data}');
      }
    }
  }

  // Future<LoginResponse> getNewAccessToken() async {
  //   if (getx.Get.find<InternetConnectivityController>()
  //           .connectivityResult
  //           .value !=
  //       ConnectivityResult.none) {
  //     try {
  //       final dio.Dio dioo = DioClient.createDio();
  //       // dioo.options.headers = await DioClient.getHeaders(authToken: authToken);
  //       final dio.Response<Map<String, dynamic>> response = await dioo
  //           .post(ApiPaths.refreshToken, data: await getRefreshToken());

  //       final parsedResponse = BaseResponse<LoginResponseData>.fromJson(
  //         response.data!,
  //         (data) => LoginResponseData.fromJson(data as Map<String, dynamic>),
  //       );
  //       return LoginResponse.success(parsedResponse);
  //     } catch (error) {
  //       return LoginResponse();
  //     }
  //   } else {
  //     showSnackBar(AppConstants.noInternetAccess);
  //     return LoginResponse();
  //   }
  // }

  // Future<Map<String, dynamic>> getRefreshToken() async {
  //   final String? token = await SharedPreferencesHelper.getString(
  //     SharedPreferenceKeys.refreshToken,
  //   );
  //   return {'refresh': token};
  // }

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
