import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/core/base/base_response.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/auth/data/constants/type_alias.dart';
import 'package:moomalpublication/features/auth/data/models/login_response_data.dart';
import 'package:moomalpublication/features/auth/data/models/token_response_data.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';
import 'package:moomalpublication/services/storage/shared_preferences_helper.dart';
import 'package:moomalpublication/services/storage/shared_preferences_keys.dart';

class LoginServices {
  LoginServices._();

  static Future<LoginResponse> login({Map<String, dynamic>? data}) async {
    if (getx.Get.find<InternetConnectivityController>().haveInternetConnection.value) {
      try {
        await _getAuthToken(data);
        final dio.Response<dynamic> response = await DioClient.dioWithAuth!.post(ApiPaths.login, data: data);

        final parsedResponse = BaseResponse<LoginResponseData>.fromJson(
          response.data! as Map<String, dynamic>,
          (data) => LoginResponseData.fromJson(data as Map<String, dynamic>),
        );

        return LoginResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showSnackBar(error.message.toString());
        return LoginResponse();
      }
    } else {
      showSnackBar("no_internet_access".tr);
      return LoginResponse();
    }
  }

  static Future<TokenResponse> _getAuthToken(Map<String, dynamic>? data) async {
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

        return TokenResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showSnackBar(error.message.toString());
        return TokenResponse();
      }
    } else {
      showSnackBar("no_internet_access".tr);
      return TokenResponse();
    }
  }
}
