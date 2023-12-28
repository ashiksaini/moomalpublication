import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/test_series/data/constants/type_alias.dart';
import 'package:moomalpublication/features/test_series/data/models/test_series_list_response_model.dart';
import 'package:moomalpublication/features/test_series/data/models/test_series_response_model.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';

class TestSeriesService {
  TestSeriesService._();

  static Future<TestSeriesResponse> getTests(
      {Map<String, dynamic>? query}) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!
            .get(ApiPaths.testSeries, queryParameters: query);

        final parsedResponse = (response.data as List<dynamic>?)!
            .map(
              (item) => TestSeriesResponseModel.fromJson(
                  item as Map<String, dynamic>),
            )
            .toList();
        return TestSeriesResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showSnackBar(error.message.toString());
        return TestSeriesResponse();
      }
    } else {
      showSnackBar("no_internet_access".tr);
      return TestSeriesResponse();
    }
  }

  static Future<TestSeriesListResponse> getTestList() async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final dio.Response<dynamic> response =
            await DioClient.dioWithoutAuth!.get(ApiPaths.testSeriesList);

        final parsedResponse =
            TestSeriesListResponseModel.fromJson(response.data);
        return TestSeriesListResponse.success([parsedResponse]);
      } on dio.DioException catch (error) {
        showSnackBar(error.message.toString());
        return TestSeriesListResponse();
      }
    } else {
      showSnackBar("no_internet_access".tr);
      return TestSeriesListResponse();
    }
  }
}
