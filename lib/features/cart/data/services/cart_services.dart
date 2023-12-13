import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/core/base/key_request_data.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/cart/data/constants/type_alias.dart';
import 'package:moomalpublication/features/cart/data/models/cart_data/cart_data.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';

class CartServices {
  CartServices._();

  static Future<CartDataResponse> getCartProducts({Map<String, dynamic>? query}) async {
    if (getx.Get.find<InternetConnectivityController>().haveInternetConnection.value) {
      try {
        
        final query = KeyRequestData(
          consumerKey: "ck_b8e432c0102bbf03a621c411c4368015e5085a2e",
          consumerSecret: "cs_e85ca09949a7f17b1945c90c3ded33ab1435ca92",
        ).toJson();

        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!.get(ApiPaths.cartData, queryParameters: query);
        final parsedResponse = CartData.fromJson(response.data as Map<String, dynamic>);

        return CartDataResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showSnackBar(error.message.toString());
        return CartDataResponse();
      }
    } else {
      showSnackBar("no_internet_access".tr);
      return CartDataResponse();
    }
  }
}
