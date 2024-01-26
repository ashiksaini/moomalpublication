import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/downloads/data/constants/type_alias.dart';
import 'package:moomalpublication/features/downloads/data/model/download_response_model/download_response_model.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';

class DownloadService {
  DownloadService._();

  static Future<DownloadResponse> getDownloadList(
      {Map<String, dynamic>? query}) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!
            .get(ApiPaths.download, queryParameters: query);
        final parsedResponse = (response.data as List<dynamic>?)!
            .map(
              (item) =>
                  DownloadResponseModel.fromJson(item as Map<String, dynamic>),
            )
            .toList();
        print(parsedResponse);
        return DownloadResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showSnackBar(error.message.toString());
        return DownloadResponse();
      }
    } else {
      showSnackBar("no_internet_access".tr);
      return DownloadResponse();
    }
  }
}
