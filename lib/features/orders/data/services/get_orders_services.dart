import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/api_keys.dart';
import 'package:moomalpublication/core/base/key_request_data.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/orders/data/constants/type_alias.dart';
import 'package:moomalpublication/features/orders/data/models/order_response_model.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';

class GetOrderService {
  GetOrderService._();

  static Future<OrderResponse> getOrders({String? id}) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final query = KeyRequestData(
          consumerKey: ApiKeys.orderConsumerKey,
          consumerSecret: ApiKeys.orderConsumerSecret,
        ).toJson();
        if (id != null) {
          query['consumer'] = id;
        }

        final dio.Response<dynamic> response = await DioClient.dioWithAuth!
            .get(ApiPaths.orders, queryParameters: query);
        final parsedResponse = (response.data as List<dynamic>)
            .map((categoryItem) => OrderResponseModel.fromJson(categoryItem))
            .toList();

        return OrderResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showSnackBar(error.message.toString());
        return OrderResponse();
      }
    } else {
      showSnackBar("no_internet_access".tr);
      return OrderResponse();
    }
  }
}
