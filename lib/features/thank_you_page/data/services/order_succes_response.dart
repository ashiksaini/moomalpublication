import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:moomalpublication/features/thank_you_page/data/constants/type_alias.dart';
import 'package:moomalpublication/features/thank_you_page/data/models/order_succes_response/order_succes_response.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';

class OrderSuccessService {
  OrderSuccessService._();

  static Future<OrderSuccessResponseData> getOrderSuccessDetails(String orderId) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final dio.Response<dynamic> response =
            await DioClient.dioWithoutAuth!.get("${ApiPaths.orderSuccess}$orderId");

        final parsedResponse = OrderSuccessResponse.fromJson(
            response.data as Map<String, dynamic>);

        return OrderSuccessResponseData.success(parsedResponse);
      } on dio.DioException catch (error) {
        showToast(error.message.toString());
        return OrderSuccessResponseData();
      }
    } else {
      showToast("no_internet_access".tr);
      return OrderSuccessResponseData();
    }
  }
}
