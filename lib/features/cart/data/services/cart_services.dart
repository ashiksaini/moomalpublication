import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/config/api_keys.dart';
import 'package:moomalpublication/core/base/add_to_cart_request_data.dart';
import 'package:moomalpublication/core/base/key_request_data.dart';
import 'package:moomalpublication/core/base/variation_request_data.dart';
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:moomalpublication/features/cart/data/constants/type_alias.dart';
import 'package:moomalpublication/features/cart/data/models/cart_data/cart_data.dart';
import 'package:moomalpublication/features/cart/data/models/checkout/checkout.dart';
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
        showToast(error.message.toString());
        return CartDataResponse();
      }
    } else {
      showToast("no_internet_access".tr);
      return CartDataResponse();
    }
  }

  static Future<CartDataResponse> addToCart(
      {String? id,
      String? quantity,
      List<VariationRequestData>? variations}) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final query = KeyRequestData(
          consumerSecret: ApiKeys.addToCartConsumerSecret,
        ).toJson();

        final data =
            AddToCartReqData(id: id, quantity: quantity, variations: variations)
                .toJson();
        final dio.Dio dioo = await _getDio();
        final dio.Response<dynamic> response = await dioo
            .post(ApiPaths.addToCart, data: data, queryParameters: query);
        final parsedResponse =
            CartData.fromJson(response.data as Map<String, dynamic>);

        return CartDataResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showToast(error.message.toString());
        return CartDataResponse();
      }
    } else {
      showToast("no_internet_access".tr);
      return CartDataResponse();
    }
  }

  static Future<CartDataResponse> updateItem(
      {String? id, String? quantity, String? key}) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final query = KeyRequestData(
          consumerKey: ApiKeys.updateCartProductsConsumerKey,
          consumerSecret: ApiKeys.updateCartProductsConsumerSecret,
        ).toJson();

        final data =
            AddToCartReqData(id: id, quantity: quantity, key: key).toJson();
        final dio.Dio dioo = await _getDio();
        final dio.Response<dynamic> response = await dioo
            .post(ApiPaths.updateCartItem, data: data, queryParameters: query);
        final parsedResponse =
            CartData.fromJson(response.data as Map<String, dynamic>);

        return CartDataResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showToast(error.message.toString());
        return CartDataResponse();
      }
    } else {
      showToast("no_internet_access".tr);
      return CartDataResponse();
    }
  }

  static Future<CartDataResponse> removeItem({String? id, String? key}) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final query = KeyRequestData(
          consumerKey: ApiKeys.deleteCartProductsConsumerKey,
          consumerSecret: ApiKeys.deleteCartProductsConsumerSecret,
        ).toJson();

        final data = AddToCartReqData(id: id, key: key).toJson();
        final dio.Dio dioo = await _getDio();
        final dio.Response<dynamic> response = await dioo
            .post(ApiPaths.removeCartItem, data: data, queryParameters: query);
        final parsedResponse =
            CartData.fromJson(response.data as Map<String, dynamic>);

        return CartDataResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showToast(error.message.toString());
        return CartDataResponse();
      }
    } else {
      showToast("no_internet_access".tr);
      return CartDataResponse();
    }
  }

  static Future<CartCheckoutResponse> checkout() async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final dio.Dio dioo = await _getDio();
        final dio.Response<dynamic> response =
            await dioo.get(ApiPaths.checkout);
        final parsedResponse =
            Checkout.fromJson(response.data as Map<String, dynamic>);

        return CartCheckoutResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showToast(error.message.toString());
        return CartCheckoutResponse();
      }
    } else {
      showToast("no_internet_access".tr);
      return CartCheckoutResponse();
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
