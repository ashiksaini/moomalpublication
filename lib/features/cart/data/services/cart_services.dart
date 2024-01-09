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
import 'package:moomalpublication/services/network/interceptor/network_interceptor.dart';
import 'package:moomalpublication/services/storage/shared_preferences_helper.dart';
import 'package:moomalpublication/services/storage/shared_preferences_keys.dart';

class CartServices {
  CartServices._();

  static Future<CartDataResponse> getCartProducts(
      {Map<String, dynamic>? query}) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final query = KeyRequestData(
          consumerKey: ApiKeys.getCartProductsConsumerKey,
          consumerSecret: ApiKeys.getCartProductsConsumerSecret,
        ).toJson();

        final dio.Response<dynamic> response = await DioClient.dioWithAuth!
            .get(ApiPaths.cartData, queryParameters: query);

        // Save nonce token to local
        if (response.headers.map.containsKey("nonce")) {
          _saveNonceTokenToLocal(response.headers.value("nonce"));
        }

        final parsedResponse =
            CartData.fromJson(response.data as Map<String, dynamic>);

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

  static Future<CartDataResponse> addToCart(
      {String? id, String? quantity}) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final query = KeyRequestData(
          consumerSecret: ApiKeys.addToCartConsumerSecret,
        ).toJson();

        final data = AddToCartReqData(id: id, quantity: quantity).toJson();
        final dio.Dio dioo = await _getDio();
        final dio.Response<dynamic> response = await dioo
            .post(ApiPaths.addToCart, data: data, queryParameters: query);
        final parsedResponse =
            CartData.fromJson(response.data as Map<String, dynamic>);

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

  static Future<CartUpdateItemResponse> updateItem(
      {String? id, String? quantity}) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final query = KeyRequestData(
          consumerKey: ApiKeys.updateCartProductsConsumerKey,
          consumerSecret: ApiKeys.updateCartProductsConsumerSecret,
        ).toJson();

        final data = AddToCartReqData(
                id: id, quantity: quantity, key: ApiKeys.updateCartItemKey)
            .toJson();
        final dio.Dio dioo = await _getDio();
        final dio.Response<dynamic> response = await dioo
            .post(ApiPaths.addToCart, data: data, queryParameters: query);
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

  static Future<CartUpdateItemResponse> removeItem({String? id}) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final query = KeyRequestData(
          consumerKey: ApiKeys.deleteCartProductsConsumerKey,
          consumerSecret: ApiKeys.deleteCartProductsConsumerSecret,
        ).toJson();

        final data =
            AddToCartReqData(id: id, key: ApiKeys.deleteCartItemKey).toJson();
        final dio.Dio dioo = await _getDio();
        final dio.Response<dynamic> response = await dioo
            .post(ApiPaths.removeCartItem, data: data, queryParameters: query);
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

  static void _saveNonceTokenToLocal(String? value) async {
    await SharedPreferencesHelper.setValue(SharedPreferenceKeys.nonce, value);
  }

  static Future<dio.Dio> _getDio() async {
    final dio = DioClient.createDio();
    dio.options.headers = await DioClient.getHeaders();
    dio.interceptors.add(NetworkInterceptor());
    dio.options.headers['nonce'] =
        await SharedPreferencesHelper.getString(SharedPreferenceKeys.nonce) ??
            "";

    return dio;
  }
}
