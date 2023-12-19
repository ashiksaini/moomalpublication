import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/api_keys.dart';
import 'package:moomalpublication/core/base/key_request_data.dart';
import 'package:moomalpublication/core/base/product_item/product_item.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/search_books/data/constant/type_alias.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';

class SearchProductServices {
  SearchProductServices._();

  static Future<SearchBooksResponse> getSearchedBook({String? search}) async {
    if (getx.Get.find<InternetConnectivityController>().haveInternetConnection.value) {
      try {
        final query = KeyRequestData(
          consumerKey: ApiKeys.searchBookConsumerKey,
          consumerSecret: ApiKeys.searchBookConsumerSecret,
        ).toJson();

        query.addIf(search != null, "search", search);

        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!.get(ApiPaths.products, queryParameters: query);
        final parsedResponse = (response.data as List<dynamic>?)!
            .map(
              (item) => ProductItem.fromJson(item as Map<String, dynamic>),
            )
            .toList();

        return SearchBooksResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showSnackBar(error.message.toString());
        return SearchBooksResponse();
      }
    } else {
      showSnackBar("no_internet_access".tr);
      return SearchBooksResponse();
    }
  }
}
