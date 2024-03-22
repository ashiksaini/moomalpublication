import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/config/api_keys.dart';
import 'package:moomalpublication/core/base/client_key_request_data.dart';
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:moomalpublication/features/subscribe/data/constants/type_alias.dart';
import 'package:moomalpublication/features/subscribe/data/models/subscribe_response_data.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';

class SubscribeService {
  SubscribeService._();

  static Future<SubscribeResponse> subscribe(String email) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final query = ClientKeyRequestData(
          clientKey: ApiKeys.subscribeClientKey,
          clientSecret: ApiKeys.subscribeClientSecret,
        ).toJson();

        final data = {"email": email};

        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!
            .post(ApiPaths.subscribe, queryParameters: query, data: data);

        final parsedResponse = SubscribeResponseData.fromJson(
            response.data as Map<String, dynamic>);

        return SubscribeResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showToast(error.message.toString());
        return SubscribeResponse();
      }
    } else {
      showToast("no_internet_access".tr);
      return SubscribeResponse();
    }
  }
}
