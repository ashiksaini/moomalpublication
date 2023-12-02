import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/home/data/constants/type_alias.dart';
import 'package:moomalpublication/features/home/data/models/product_item/product_item.dart';
import 'package:moomalpublication/features/home/data/models/products_request_data.dart';
import 'package:moomalpublication/features/home/data/services/get_product_services.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class HomeController extends BaseController {
  final Rx<ProductResponse> exploreProductResponse = Rx(ProductResponse());
  final Rx<ProductResponse> newArrivalProductResponse = Rx(ProductResponse());
  final Rx<ProductResponse> bestSellerProductResponse = Rx(ProductResponse());

  RxList<ProductItem> exploreProductList = RxList([]);
  RxList<ProductItem> newArrivalProductList = RxList([]);
  RxList<ProductItem> bestSellerProductList = RxList([]);

  @override
  void onInit() {
    super.onInit();

    _getExploreBooks();
    _getNewArrivalBooks();
    _getBestSellerBooks();
  }

  Future<void> _getExploreBooks() async {
    exploreProductResponse.value = ApiResponse.loading();
    exploreProductResponse.value = await GetProductServices.getProducts(query: _getQueryParams(perPage: 6));

    if (exploreProductResponse.value.data != null) {
      exploreProductList.addAll(exploreProductResponse.value.data ?? []);
    } else {
      showSnackBar(AppConstants.somethingWentWrong);
    }
  }

  Future<void> _getNewArrivalBooks() async {
    newArrivalProductResponse.value = ApiResponse.loading();
    newArrivalProductResponse.value = await GetProductServices.getProducts(query: _getQueryParams(perPage: 4, orderBy: "date", order: "desc"));

    if (newArrivalProductResponse.value.data != null) {
      newArrivalProductList.addAll(newArrivalProductResponse.value.data ?? []);
    } else {
      showSnackBar(AppConstants.somethingWentWrong);
    }
  }

  Future<void> _getBestSellerBooks() async {
    bestSellerProductResponse.value = ApiResponse.loading();
    bestSellerProductResponse.value = await GetProductServices.getProducts(query: _getQueryParams(perPage: 4, orderBy: "popularity", order: "desc"));

    if (bestSellerProductResponse.value.data != null) {
      bestSellerProductList.addAll(bestSellerProductResponse.value.data ?? []);
    } else {
      showSnackBar(AppConstants.somethingWentWrong);
    }
  }

  Map<String, dynamic> _getQueryParams({int? category, String? orderBy, String? order, int? perPage}) {
    return ProductRequestData(
      category: category,
      orderBy: orderBy,
      order: order,
      perPage: perPage,
    ).toJson();
  }
}
