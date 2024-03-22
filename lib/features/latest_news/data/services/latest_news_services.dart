
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:moomalpublication/features/latest_news/data/constants/type_alias.dart';
import 'package:moomalpublication/features/latest_news/data/model/latest_news_item/latest_news_item.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';

class LatestNewsServices {
  LatestNewsServices._();

  static Future<LatestNewsResponse> getLatestNews() async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!
            .get(ApiPaths.latestNews);

        final parsedResponse = (response.data as List<dynamic>?)?.map((item) => LatestNewsItem.fromJson(item)).toList();

        return LatestNewsResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showToast(error.message.toString());
        return LatestNewsResponse();
      }
    } else {
      showToast("no_internet_access".tr);
      return LatestNewsResponse();
    }
  }
}
