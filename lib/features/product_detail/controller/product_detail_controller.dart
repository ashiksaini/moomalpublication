import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/base/product_item/product_item.dart';
import 'package:moomalpublication/core/utils/shared_data.dart';
import 'package:moomalpublication/features/product_detail/data/constants/type_alias.dart';
import 'package:moomalpublication/features/product_detail/data/models/product_detail/product_detail_data.dart';
import 'package:moomalpublication/features/product_detail/data/models/product_review.dart';
import 'package:moomalpublication/features/product_detail/data/services/product_detail_services.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class ProductDetailController extends BaseController {
  late SharedData _sharedData;
  late int? productId;
  final quantities = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  RxString productName = RxString("");
  Rx<ProductDetailResponse> productDetailResponse = Rx(ApiResponse());
  Rx<SimilarProductResponse> similarProductResponse = Rx(ApiResponse());
  Rx<ProductReviewsResponse> productReviewsResponse = Rx(ApiResponse());

  Rx<ProductDetailData?> productDetailData = Rx(null);
  RxList<ProductReview> productReviews = RxList([]);
  RxList<ProductItem> similarProducts = RxList([]);
  RxInt selectedQuantity = RxInt(1);

  @override
  void onInit() {
    super.onInit();

    _sharedData = Get.arguments as SharedData;
    productName.value = _sharedData.productName ?? "";
    productId = _sharedData.productId;

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
      similarProductResponse.value = await ProductDetailServices.getSimilerReviews(productId!);

      if (similarProductResponse.value.data != null) {
        similarProducts.value = similarProductResponse.value.data!;
      }
    }
  }

  void onItemClick(int index, ProductItem data) {
    AppRouting.toNamed(NameRoutes.productDetailScreen, argument: SharedData(productId: data.id, productName: data.name));
  }
}
