import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/core/base/product_item/attribute.dart';
import 'package:moomalpublication/core/base/product_item/product_item.dart';
import 'package:moomalpublication/core/base/product_item/product_variations.dart';
import 'package:moomalpublication/core/constants/enums.dart';
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:moomalpublication/features/search_books/data/constant/type_alias.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';

class SearchProductServices {
  SearchProductServices._();

  static Future<SearchBooksResponse> getSearchedBook(
      {String? search, Map<String, dynamic>? query}) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        query?.addIf(search != null, "search", search);

        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!
            .get(ApiPaths.products, queryParameters: query);
        final parsedResponse = (response.data as List<dynamic>?)!
            .map(
              (item) => ProductItem.fromJson(item as Map<String, dynamic>),
            )
            .toList();

        for (var element in parsedResponse) {
          if (element.productVariations?.isEmpty == true) {
            element.productVariations?.add(
              ProductVariations(
                id: element.id,
                onSale: element.onSale,
                regularPrice: element.regularPrice,
                salePrice: element.salePrice,
                sku: element.sku,
                quantity: element.quantity.toString(),
                stockStatus: (element.stockStatus == null)
                    ? (element.inStock == true)
                        ? "instock"
                        : "outofstock"
                    : element.stockStatus,
                attributes: [
                  Attribute(name: "purchase", slug: "purchase", option: "book")
                ],
              ),
            );
          }

          for (ProductVariations variation in element.productVariations ?? []) {
            if (variation.attributes?[0].option
                        ?.toLowerCase()
                        .compareTo("ebook") ==
                    0 &&
                variation.stockStatus?.toLowerCase().compareTo("instock") ==
                    0) {
              element.isEbookAvailable = true;
            }

            if (variation.attributes?[0].option
                        ?.toLowerCase()
                        .compareTo("book") ==
                    0 &&
                variation.stockStatus?.toLowerCase().compareTo("instock") ==
                    0) {
              element.isBookAvailable = true;
            }

            if ((element.isBookAvailable && element.isEbookAvailable) ||
                element.isEbookAvailable) {
              element.productVariationType.value = ProductVariation.ebook;
            } else if (element.isBookAvailable) {
              element.productVariationType.value = ProductVariation.book;
            }
          }
        }

        return SearchBooksResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showToast(error.message.toString());
        return SearchBooksResponse();
      }
    } else {
      showToast("no_internet_access".tr);
      return SearchBooksResponse();
    }
  }
}
