import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/config/api_keys.dart';
import 'package:moomalpublication/core/base/key_request_data.dart';
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:moomalpublication/features/ebook/data/constants/type_alias.dart';
import 'package:moomalpublication/features/ebook/data/models/e_book_category_item/e_book_category_item.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';

class EBookServices {
  EBookServices._();

  static Future<EBookCategoryResponse> getEBookCategories(
      {Map<String, dynamic>? query}) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final query = KeyRequestData(
          consumerKey: ApiKeys.ebookCategoryConsumerKey,
          consumerSecret: ApiKeys.ebookCategoryConsumerSecret,
        ).toJson();

        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!
            .get(ApiPaths.eBookProductCategory, queryParameters: query);
        final parsedResponse = (response.data as List<dynamic>)
            .map((categoryItem) => EBookCategoryItem.fromJson(categoryItem))
            .toList();

        return EBookCategoryResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showToast(error.message.toString());
        return EBookCategoryResponse();
      }
    } else {
      showToast("no_internet_access".tr);
      return EBookCategoryResponse();
    }
  }
}
