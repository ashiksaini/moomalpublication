import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/config/api_keys.dart';
import 'package:moomalpublication/core/base/key_request_data.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/address/data/constants/type_alias.dart';
import 'package:moomalpublication/features/address/data/models/address_data/address_data.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';
import 'package:moomalpublication/services/storage/shared_preferences_helper.dart';
import 'package:moomalpublication/services/storage/shared_preferences_keys.dart';

class AddressServices {
  AddressServices._();

  static Future<AddressDataResponse> getAddress() async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final userId =
            await SharedPreferencesHelper.getInt(SharedPreferenceKeys.userId);
        final query = KeyRequestData(
          consumerKey: ApiKeys.addressDataConsumerKey,
          consumerSecret: ApiKeys.addressDataConsumerSecret,
        ).toJson();

        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!
            .get("${ApiPaths.address}$userId", queryParameters: query);

        final parsedResponse =
            AddressData.fromJson(response.data as Map<String, dynamic>);

        return AddressDataResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showSnackBar(error.message.toString());
        return AddressDataResponse();
      }
    } else {
      showSnackBar("no_internet_access".tr);
      return AddressDataResponse();
    }
  }

  static Future<AddressDataResponse> upsertAddress(
      Map<String, dynamic> address) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final userId =
            await SharedPreferencesHelper.getInt(SharedPreferenceKeys.userId);
        final query = KeyRequestData(
          consumerKey: ApiKeys.addressDataConsumerKey,
          consumerSecret: ApiKeys.addressDataConsumerSecret,
        ).toJson();

        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!
            .put("${ApiPaths.address}$userId",
                queryParameters: query, data: address);

        final parsedResponse =
            AddressData.fromJson(response.data as Map<String, dynamic>);

        return AddressDataResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showSnackBar(error.message.toString());
        return AddressDataResponse();
      }
    } else {
      showSnackBar("no_internet_access".tr);
      return AddressDataResponse();
    }
  }
}
