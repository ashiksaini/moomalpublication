import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/core/utils/toast.dart';import 'package:moomalpublication/features/downloads/data/constants/type_alias.dart';
import 'package:moomalpublication/features/downloads/data/model/download_response_model/download_response_model.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';
import 'package:moomalpublication/services/storage/shared_preferences_helper.dart';
import 'package:moomalpublication/services/storage/shared_preferences_keys.dart';

class DownloadService {
  DownloadService._();

  static Future<DownloadResponse> getDownloadList() async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final userId =
            await SharedPreferencesHelper.getInt(SharedPreferenceKeys.userId);
        final query = {'user_id': userId};
        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!
            .get(ApiPaths.download, queryParameters: query);
        final parsedResponse = (response.data as List<dynamic>?)!
            .map(
              (item) =>
                  DownloadResponseModel.fromJson(item as Map<String, dynamic>),
            )
            .toList();
        return DownloadResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showToast(error.message.toString());
        return DownloadResponse();
      }
    } else {
      showToast("no_internet_access".tr);
      return DownloadResponse();
    }
  }
}
