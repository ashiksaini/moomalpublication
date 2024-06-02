import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/core/base/product_item/attribute.dart';
import 'package:moomalpublication/core/base/product_item/product_variations.dart';
import 'package:moomalpublication/core/constants/enums.dart';
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:moomalpublication/features/home/data/constants/type_alias.dart';
import 'package:moomalpublication/core/base/product_item/product_item.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';

class GetProductServices {
  GetProductServices._();

  static Future<ProductResponse> getProducts(
      {Map<String, dynamic>? query}) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!
            .get(ApiPaths.products, queryParameters: query);
        final parsedResponse = (response.data as List<dynamic>?)!
            .map(
              (item) => ProductItem.fromJson(item as Map<String, dynamic>),
            )
            .toList();

        for (ProductItem element in parsedResponse) {
          if (element.productVariations?.isEmpty == true) {
            element.productVariations?.add(
              ProductVariations(
                id: element.id,
                onSale: element.onSale,
                regularPrice: element.regularPrice,
                salePrice: element.salePrice,
                sku: element.sku,
                quantity: element.quantity.toString(),
                stockStatus: (element.stockStatus == null) ? (element.inStock == true) ? "instock" : "outofstock" : element.stockStatus,
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

        return ProductResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showToast(error.message.toString());
        return ProductResponse();
      }
    } else {
      showToast("no_internet_access".tr);
      return ProductResponse();
    }
  }

  static Future<ProductResponse> getProductsV3(
      {Map<String, dynamic>? query}) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!
            .get(ApiPaths.productsV3, queryParameters: query);
        final parsedResponse = (response.data as List<dynamic>?)!
            .map(
              (item) => ProductItem.fromJson(item as Map<String, dynamic>),
            )
            .toList();

        for (ProductItem element in parsedResponse) {
          if (element.productVariations?.isEmpty == true) {
            element.productVariations?.add(
              ProductVariations(
                id: element.id,
                onSale: element.onSale,
                regularPrice: element.regularPrice,
                salePrice: element.salePrice,
                sku: element.sku,
                quantity: element.quantity.toString(),
                stockStatus: element.stockStatus,
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

        return ProductResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showToast(error.message.toString());
        return ProductResponse();
      }
    } else {
      showToast("no_internet_access".tr);
      return ProductResponse();
    }
  }
}
