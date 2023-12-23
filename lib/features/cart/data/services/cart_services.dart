import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/api_keys.dart';
import 'package:moomalpublication/core/base/add_to_cart_request_data.dart';
import 'package:moomalpublication/core/base/base_response.dart';
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
          consumerKey: ApiKeys.getCartProductsConsumerKey,
          consumerSecret: ApiKeys.getCartProductsConsumerSecret,
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

  static Future<CartDataResponse> addToCart({String? id, String? quantity}) async {
    if (getx.Get.find<InternetConnectivityController>().haveInternetConnection.value) {
      try {
        final query = KeyRequestData(
          consumerKey: ApiKeys.addToCartConsumerKey,
          consumerSecret: ApiKeys.addToCartConsumerSecret,
        ).toJson();

        final data = AddToCartReqData(id: id, quantity: quantity).toJson();

        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!.post(ApiPaths.addToCart, data: data, queryParameters: query);
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

  static Future<CartUpdateItemResponse> updateItem({String? id, String? quantity}) async {
    if (getx.Get.find<InternetConnectivityController>().haveInternetConnection.value) {
      try {
        final query = KeyRequestData(
          consumerKey: ApiKeys.addToCartConsumerKey,
          consumerSecret: ApiKeys.addToCartConsumerSecret,
        ).toJson();

        final data = AddToCartReqData(id: id, quantity: quantity, key: "88052b22c8c2349c0599bd39a654c534").toJson();

        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!.post(ApiPaths.addToCart, data: data, queryParameters: query);
        final parsedResponse = BaseResponse.fromJson(
          response.data as Map<String, dynamic>,
          (data) => CartData.fromJson(data as Map<String, dynamic>),
        );

        return CartUpdateItemResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showSnackBar(error.message.toString());
        return CartUpdateItemResponse();
      }
    } else {
      showSnackBar("no_internet_access".tr);
      return CartUpdateItemResponse();
    }
  }
}
