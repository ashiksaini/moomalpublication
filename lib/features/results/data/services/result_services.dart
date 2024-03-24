import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:moomalpublication/features/results/data/constants/type_alias.dart';
import 'package:moomalpublication/features/results/data/models/result.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';

class ResultServices {
  ResultServices._();

  static Future<OverallResultResponse> getOverallResult() async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final dio.Response<dynamic> response =
            await DioClient.dioWithAuth!.get(ApiPaths.overAllResult);
        final parsedResponse = (response.data as List<dynamic>?)
            ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
            .toList();
        return OverallResultResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showToast(error.message.toString());
        return OverallResultResponse();
      }
    } else {
      showToast("no_internet_access".tr);
      return OverallResultResponse();
    }
  }
}