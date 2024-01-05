import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/base/product_item/product_item.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/constants/enums.dart';
import 'package:moomalpublication/core/utils/shared_data.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/cart/data/services/cart_services.dart';
import 'package:moomalpublication/features/home/data/constants/type_alias.dart';
import 'package:moomalpublication/features/home/data/models/products_request_data.dart';
import 'package:moomalpublication/features/home/data/services/get_product_services.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class CategoryWiseController extends BaseController {
  late SharedData sharedData;
  final RxBool includeOutOfStockItem = RxBool(false);

  final Rx<ProductResponse> productResponse = Rx(ProductResponse());
  RxList<ProductItem> productList = RxList([]);
  RxBool isLastPage = RxBool(false);
  RxBool isLoadingMore = RxBool(false);
  String? orderBy;
  String? order;
  String stockStatus = "instock";
  SortBy? selectedSortBy;

  int _pageNo = 1;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();

    sharedData = Get.arguments as SharedData;
    scrollController.addListener(_scrollListener);

    _getCategoryWiseBooks();
  }

  void onFilterItemClick(SortBy sortBy) {
    selectedSortBy = sortBy;
    switch (sortBy) {
      case SortBy.averageRating:
        {
          orderBy = "rating";
        }
        break;

      case SortBy.popularity:
        {
          orderBy = "popularity";
        }
        break;

      case SortBy.priceHToL:
        {
          orderBy = "price";
          order = "desc";
        }
        break;

      case SortBy.priceLToH:
        {
          orderBy = "price";
          order = "asc";
        }
        break;
      default:
    }

    _clearNResetPage();
    _getCategoryWiseBooks();
  }

  void canIncludeOutOfStockItem(bool? value) {
    includeOutOfStockItem.value = value ?? false;
    if (includeOutOfStockItem.value) {
      stockStatus = "outofstock";
    } else {
      stockStatus = "instock";
    }

    _clearNResetPage();
    _getCategoryWiseBooks();
  }

  Future<void> _getCategoryWiseBooks() async {
    if (_pageNo < 2) {
      productResponse.value = ApiResponse.loading();
    }

    isLoadingMore.value = false;
    productResponse.value = await GetProductServices.getProducts(
      query: ProductRequestData(
        perPage: 20,
        page: _pageNo,
        category: sharedData.categoryId,
        order: order,
        orderBy: orderBy,
        stockStatus: stockStatus,
      ).toJson(),
    );
    if (productResponse.value.data != null) {
      if (productResponse.value.data!.isEmpty) isLastPage.value = true;
      productList.addAll(productResponse.value.data ?? []);
    } else {
      showSnackBar(AppConstants.somethingWentWrong);
    }
  }

  Future<void> loadMoreData() async {
    if (!isLoadingMore.value && !isLastPage.value) {
      isLoadingMore.value = true;
    }

    Future.delayed(const Duration(seconds: 1), () {
      if (!isLastPage.value) {
        ++_pageNo;
        _getCategoryWiseBooks();
      }
    });
  }

  void _scrollListener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      loadMoreData();
    }
  }

  void _clearNResetPage() {
    _pageNo = 1;
    isLastPage.value = false;
    productList.clear();
  }

  Future<void> onRefresh() async {
    _clearNResetPage();
    canIncludeOutOfStockItem(false);
    selectedSortBy = null;
    order = null;
    orderBy = null;

    _getCategoryWiseBooks();
  }

  void onItemClick(int index, ProductItem data) {
    AppRouting.toNamed(
      NameRoutes.productDetailScreen,
      argument: SharedData(
        productItem: data,
        backStackRoute: NameRoutes.categoryWiseScreen,
      ),
    );
  }

  Future<void> onCartBtnClick(ProductItem item) async {
    switch (item.cartBtnType.value) {
      case CartBtnType.addToCart:
        {
          final addToCartResponse = await CartServices.addToCart(
            id: item.id.toString(),
            quantity: item.quantity.toString(),
          );
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
}
