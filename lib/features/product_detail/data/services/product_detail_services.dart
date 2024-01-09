import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/api_keys.dart';
import 'package:moomalpublication/core/base/key_request_data.dart';
import 'package:moomalpublication/core/base/product_item/product_item.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/product_detail/data/constants/type_alias.dart';
import 'package:moomalpublication/features/product_detail/data/models/product_review.dart';
import 'package:moomalpublication/features/product_detail/data/models/review_post_response/review_post_response_data.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';

class ProductDetailServices {
  ProductDetailServices._();

  static Future<ProductDetailResponse> getProductDetails(int productId) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final query = KeyRequestData(
          consumerKey: ApiKeys.productDetailConsumerKey,
          consumerSecret: ApiKeys.productDetailConsumerSecret,
        ).toJson();
        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!
            .get("${ApiPaths.productDetail}$productId", queryParameters: query);
        final parsedResponse =
            ProductItem.fromJson(response.data as Map<String, dynamic>);
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
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final query = KeyRequestData(
          consumerKey: ApiKeys.productReviewConsumerKey,
          consumerSecret: ApiKeys.productReviewConsumerSecret,
        ).toJson();
        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!
            .get("${ApiPaths.productReviews}$productId",
                queryParameters: query);
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

  static Future<SimilarProductResponse> getSimilarReviews(int productId) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final query = KeyRequestData(
          consumerKey: ApiKeys.similarProductReviewConsumerKey,
          consumerSecret: ApiKeys.similarProductReviewConsumerSecret,
        ).toJson();
        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!
            .get("${ApiPaths.productRelated}$productId",
                queryParameters: query);
        final parsedResponse = (response.data as List<dynamic>?)!
            .map(
              (item) => ProductItem.fromJson(item as Map<String, dynamic>),
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

  static Future<ReviewPostResponse> postReview(
      Map<String, dynamic> data) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final query = KeyRequestData(
          consumerKey: ApiKeys.postReviewConsumerKey,
          consumerSecret: ApiKeys.postReviewConsumerSecret,
        ).toJson();

        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!
            .post(ApiPaths.productReviewPost,
                queryParameters: query, data: data);
        final parsedResponse = ReviewPostResponseData.fromJson(
            response.data as Map<String, dynamic>);
        return ReviewPostResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showSnackBar(error.message.toString());
        return ReviewPostResponse();
      }
    } else {
      showSnackBar("no_internet_access".tr);
      return ReviewPostResponse();
    }
  }
}
