import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/base/product_item/product_item.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/home/data/constants/type_alias.dart';
import 'package:moomalpublication/features/home/data/models/products_request_data.dart';
import 'package:moomalpublication/features/home/data/services/get_product_services.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class ShopController extends BaseController {
  final Rx<ProductResponse> productResponse = Rx(ProductResponse());
  RxList<ProductItem> productList = RxList([]);
  RxBool isLastPage = RxBool(false);
  RxBool isLoadingMore = RxBool(false);

  int _pageNo = 1;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();

    _getExploreBooks();
    scrollController.addListener(_scrollListener);
  }

  Future<void> _getExploreBooks() async {
    if (_pageNo < 2) {
      productResponse.value = ApiResponse.loading();
    }

    isLoadingMore.value = false;
    productResponse.value = await GetProductServices.getProducts(
        query: ProductRequestData(perPage: 20, page: _pageNo).toJson());
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
        _getExploreBooks();
      }
    });
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadMoreData();
    }
  }

  Future<void> onRefresh() async {
    _pageNo = 1;
    isLastPage.value = false;
    productList.clear();
    _getExploreBooks();
  }
}
