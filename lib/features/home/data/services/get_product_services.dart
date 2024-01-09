import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/home/data/constants/type_alias.dart';
import 'package:moomalpublication/core/base/product_item/product_item.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';

class GetProductServices {
  GetProductServices._();

  static Future<ProductResponse> getProducts({Map<String, dynamic>? query}) async {
    if (getx.Get.find<InternetConnectivityController>().haveInternetConnection.value) {
      try {
        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!.get(ApiPaths.products, queryParameters: query);
        final parsedResponse = (response.data as List<dynamic>?)!
            .map(
              (item) => ProductItem.fromJson(item as Map<String, dynamic>),
            )
            .toList();

        for (var element in parsedResponse) {
          for (var variation in element.variations!) {
            if (variation.attributes?.attributePurchase?.toLowerCase().compareTo("ebook") == 0 && variation.stockStatus?.toLowerCase().compareTo("instock") == 0) {
              element.isEbookAvailable = true;
            } else if (variation.attributes?.attributePurchase?.toLowerCase().compareTo("book") == 0 && variation.stockStatus?.toLowerCase().compareTo("instock") == 0) {
              element.isBookAvailable = true;
            }
          }
        }

        return ProductResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showSnackBar(error.message.toString());
        return ProductResponse();
      }
    } else {
      showSnackBar("no_internet_access".tr);
      return ProductResponse();
    }
  }
}
