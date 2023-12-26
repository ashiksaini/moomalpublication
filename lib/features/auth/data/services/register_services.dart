import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/core/base/base_response.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/auth/data/constants/type_alias.dart';
import 'package:moomalpublication/features/auth/data/models/user_data.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';

class RegisterUserServices {
  RegisterUserServices._();

  static Future<RegisterUserResponse> register(
      {Map<String, dynamic>? data}) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!
            .post(ApiPaths.registerUser, data: data);

        final parsedResponse = BaseResponse<UserData>.fromJson(
          response.data! as Map<String, dynamic>,
          (data) => UserData.fromJson(data as Map<String, dynamic>),
        );

        return RegisterUserResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        final parsedResponse = BaseResponse<UserData>.fromJson(
          error.response!.data as Map<String, dynamic>,
          (data) => UserData.fromJson(data as Map<String, dynamic>),
        );

        return RegisterUserResponse.success(parsedResponse);
      }
    } else {
      showSnackBar("no_internet_access".tr);
      return RegisterUserResponse();
    }
  }
}
