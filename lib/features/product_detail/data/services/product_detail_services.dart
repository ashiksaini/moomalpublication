import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/product_detail/data/constants/type_alias.dart';
import 'package:moomalpublication/features/product_detail/data/models/product_detail/product_detail_data.dart';
import 'package:moomalpublication/features/product_detail/data/models/product_detail_request_data.dart';
import 'package:moomalpublication/features/product_detail/data/models/product_review.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';

class ProductDetailServices {
  ProductDetailServices._();

  static Future<ProductDetailResponse> getProductDetails(int productId) async {
    if (getx.Get.find<InternetConnectivityController>().haveInternetConnection.value) {
      try {
        final query = ProductDetailRequestData(
          consumerKey: "ck_7c962588077c2edb8d7f342c8ba15fec7e985277",
          consumerSecret: "cs_75485d6ac7accec31722bb8028b4be15e6bf86d4",
        ).toJson();
        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!.get("${ApiPaths.productDetail}$productId", queryParameters: query);
        final parsedResponse = ProductDetailData.fromJson(response.data as Map<String, dynamic>);
        return ProductDetailResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showSnackBar(error.message.toString());
        return ProductDetailResponse();
      }
    } else {
      showSnackBar("no_internet_access".tr);
      return ProductDetailResponse();
    }
  }

  static Future<ProductReviewsResponse> getProductReviews(int productId) async {
    if (getx.Get.find<InternetConnectivityController>().haveInternetConnection.value) {
      try {
        final query = ProductDetailRequestData(
          consumerKey: "ck_6fd70bd94149beb477a2a27cf3b55122e126865c",
          consumerSecret: "cs_96a34ed50cf847f554c5be76f57c148e7b6a3262",
        ).toJson();
        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!.get("${ApiPaths.productReviews}$productId", queryParameters: query);
        final parsedResponse = (response.data as List<dynamic>?)!
            .map(
              (item) => ProductReview.fromJson(item as Map<String, dynamic>),
            )
            .toList();
        return ProductReviewsResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showSnackBar(error.message.toString());
        return ProductReviewsResponse();
      }
    } else {
      showSnackBar("no_internet_access".tr);
      return ProductReviewsResponse();
    }
  }

  static Future<SimilarProductResponse> getSimilerReviews(int productId) async {
    if (getx.Get.find<InternetConnectivityController>().haveInternetConnection.value) {
      try {
        final query = ProductDetailRequestData(
          consumerKey: "ck_84ab63d0ace9fb179e45f15af31dafd7cae7da68",
          consumerSecret: "cs_3756d329c7e7122e4f71f305f3fc0c70f216ed0a",
        ).toJson();
        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!.get("${ApiPaths.productRelated}$productId", queryParameters: query);
        final parsedResponse = (response.data as List<dynamic>?)!
            .map(
              (item) => ProductDetailData.fromJson(item as Map<String, dynamic>),
            )
            .toList();
        return SimilarProductResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showSnackBar(error.message.toString());
        return SimilarProductResponse();
      }
    } else {
      showSnackBar("no_internet_access".tr);
      return SimilarProductResponse();
    }
  }
}
