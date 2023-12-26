import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/core/base/base_response.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/auth/data/constants/type_alias.dart';
import 'package:moomalpublication/features/auth/data/models/user_data.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';

class ResetPasswordServices {
  ResetPasswordServices._();

  static Future<ResetPasswordResponse> resetPassword(
      {Map<String, dynamic>? data}) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!
            .post(ApiPaths.resetPassword, data: data);

        final parsedResponse = BaseResponse<UserData>.fromJson(
          response.data! as Map<String, dynamic>,
          (data) => UserData.fromJson(data as Map<String, dynamic>),
        );

        return ResetPasswordResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showSnackBar(error.message.toString());
        return ResetPasswordResponse();
      }
    } else {
      showSnackBar("no_internet_access".tr);
      return ResetPasswordResponse();
    }
  }
}
