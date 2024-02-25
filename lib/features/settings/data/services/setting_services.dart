import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/config/api_keys.dart';
import 'package:moomalpublication/core/base/base_response.dart';
import 'package:moomalpublication/core/base/key_request_data.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/settings/data/constant/type_alias.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';
import 'package:moomalpublication/services/storage/shared_preferences_helper.dart';
import 'package:moomalpublication/services/storage/shared_preferences_keys.dart';

class SettingsServices {
  SettingsServices._();

  static Future<DeleteAccountResponse> deleteAccount() async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final userId =
            await SharedPreferencesHelper.getInt(SharedPreferenceKeys.userId);
        final query = KeyRequestData(
          consumerKey: ApiKeys.deleteAccountConsumerKey,
          consumerSecret: ApiKeys.deleteAccountConsumerSecret,
        ).toJson();
        query.putIfAbsent("force", () => true);

        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!
            .delete("${ApiPaths.deleteAccount}$userId", queryParameters: query);
        final parsedResponse = BaseResponse.fromJson(
          response.data as Map<String, dynamic>,
          (data) => null,
        );

        return DeleteAccountResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showSnackBar(error.message.toString());
        return DeleteAccountResponse();
      }
    } else {
      showSnackBar("no_internet_access".tr);
      return DeleteAccountResponse();
    }
  }
}
