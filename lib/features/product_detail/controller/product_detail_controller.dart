import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/base/product_item/product_item.dart';
import 'package:moomalpublication/core/base/product_item/variation.dart';
import 'package:moomalpublication/core/constants/enums.dart';
import 'package:moomalpublication/core/utils/extensions.dart';
import 'package:moomalpublication/core/utils/shared_data.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/cart/data/services/cart_services.dart';
import 'package:moomalpublication/features/product_detail/data/constants/type_alias.dart';
import 'package:moomalpublication/features/product_detail/data/models/product_review.dart';
import 'package:moomalpublication/features/product_detail/data/services/product_detail_services.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';
import 'package:moomalpublication/services/storage/shared_preferences_helper.dart';
import 'package:moomalpublication/services/storage/shared_preferences_keys.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailController extends BaseController {
  TextEditingController writeReviewTextEditingController = TextEditingController();
  late Rx<ProductItem?> productItem = Rx(null);
  late SharedData _sharedData;
  late int? productId;
  String name = "";
  String email = "";
  double rating = 0.0;
  final quantities = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  RxString productName = RxString("");
  RxString categories = RxString("");
  RxString sku = RxString("");
  RxBool isEbookAvailable = RxBool(false);
  RxBool isBookAvailable = RxBool(false);
  Rx<ProductDetailResponse> productDetailResponse = Rx(ApiResponse());
  Rx<SimilarProductResponse> similarProductResponse = Rx(ApiResponse());
  Rx<ProductReviewsResponse> productReviewsResponse = Rx(ApiResponse());
  Rx<ReviewPostResponse> postReviewResponse = Rx(ApiResponse());

  Rx<ProductItem?> productDetailData = Rx(null);
  RxList<ProductReview> productReviews = RxList([]);
  RxList<ProductItem> similarProducts = RxList([]);
  RxInt selectedQuantity = RxInt(1);

  @override
  void onInit() {
    super.onInit();

    _sharedData = Get.arguments as SharedData;
    productItem.value = _sharedData.productItem;

    _getUserInfo();

    _getCategories();
    _getSKU();

    _getData();
  }

  Future<void> _getUserInfo() async {
    name = await SharedPreferencesHelper.getString(SharedPreferenceKeys.username) ?? "";
    email = await SharedPreferencesHelper.getString(SharedPreferenceKeys.email) ?? "";
  }

  void _getCategories() {
    if (productItem.value != null) {
      if (productItem.value!.categories != null && productItem.value!.categories!.isNotEmpty) {
        for (var category in productItem.value!.categories!) {
          categories.value += "${category.name},";
        }

        if (categories.isNotEmpty) {
          categories.value = categories.value.substring(0, categories.value.length - 1);
        } else {
          categories.value = "not_define".tr;
        }
      }
    }
  }

  void _getSKU() {
    sku.value = productItem.value?.sku?.isNotNullAndEmpty == true ? "not_define".tr : productItem.value?.sku ?? "not_define".tr;
  }

  void _getData({String? tempProductName, int? tempProductId}) {
    productName.value = tempProductName ?? _sharedData.productItem?.name ?? "";
    productId = tempProductId ?? _sharedData.productItem?.id ?? 0;

    _getProductDetails();
    _getProductReviews();
    _getSimilarProducts();
  }

  Future<void> _getProductDetails() async {
    if (productId != null) {
      productDetailResponse.value = ApiResponse.loading();
      productDetailResponse.value = await ProductDetailServices.getProductDetails(productId!);

      if (productDetailResponse.value.data != null) {
        productDetailData.value = productDetailResponse.value.data;

        if (productDetailData.value!.variations != null && productDetailData.value!.variations!.isNotEmpty) {
          for (var variation in productDetailData.value!.variations!) {
            if (variation is Variation) {
              if (variation.attributes?.attributePurchase?.compareTo("ebook") == 0 && variation.stockStatus?.compareTo("instock") == 0) {
                isEbookAvailable.value = true;
              } else if (variation.attributes?.attributePurchase?.compareTo("book") == 0 && variation.stockStatus?.compareTo("instock") == 0) {
                isEbookAvailable.value = true;
              }
            }
          }
        }
      }
    }
  }

  Future<void> _getProductReviews() async {
    if (productId != null) {
      productReviewsResponse.value = ApiResponse.loading();
      productReviewsResponse.value = await ProductDetailServices.getProductReviews(productId!);

      if (productReviewsResponse.value.data != null) {
        productReviews.value = productReviewsResponse.value.data!;
      }
    }
  }

  Future<void> _getSimilarProducts() async {
    if (productId != null) {
      similarProductResponse.value = ApiResponse.loading();
      similarProductResponse.value = await ProductDetailServices.getSimilarReviews(productId!);

      if (similarProductResponse.value.data != null) {
        similarProducts.value = similarProductResponse.value.data!;
      }
    }
  }

  void onItemClick(int index, ProductItem data) {
    _getData(tempProductName: data.name, tempProductId: data.id);
  }

  Future<void> onCartBtnClick(ProductItem item) async {
    switch (item.cartBtnType.value) {
      case CartBtnType.addToCart:
        {
          final addToCartResponse = await CartServices.addToCart(id: item.id.toString(), quantity: item.quantity.toString());
          if (addToCartResponse.data != null) {
            item.cartBtnType.value = CartBtnType.goToCart;
          }
        }
        break;

      case CartBtnType.goToCart:
        AppRouting.offAllNamed(NameRoutes.moomalpublicationApp, argument: 3);
        break;
    }
  }

  void shareItem() {
    if (_sharedData.productItem?.permalink != null && _sharedData.productItem!.permalink!.isNotEmpty) {
      Share.share(_sharedData.productItem!.permalink!);
    }
  }

  void onRatingUpdate(double rating) {
    this.rating = rating;
  }

  Future<void> onReviewSubmit() async {
    if (writeReviewTextEditingController.text.isEmpty) {
      showSnackBar("please_write_a_review_first".tr);
    } else {
      final data = _getReview();

      postReviewResponse.value = ApiResponse.loading();
      postReviewResponse.value = await ProductDetailServices.postReview(data);

      if (postReviewResponse.value.data != null) {
        showSnackBar("review_posted_successfully".tr);
        Future.delayed(const Duration(seconds: 2), () => AppRouting.navigateBack());
      }
    }
  }

  Map<String, dynamic> _getReview() {
    return {
      "product_id": productId,
      "review": writeReviewTextEditingController.text,
      "reviewer": name,
      "reviewer_email": email,
      "rating": rating.toInt(),
    };
  }
}
