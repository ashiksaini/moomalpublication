import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/base/product_item/product_item.dart';
import 'package:moomalpublication/core/base/product_item/product_variations.dart';
import 'package:moomalpublication/core/base/variation_request_data.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/constants/enums.dart';
import 'package:moomalpublication/core/utils/shared_data.dart';
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:moomalpublication/features/cart/controller/cart_controller.dart';
import 'package:moomalpublication/features/cart/data/services/cart_services.dart';
import 'package:moomalpublication/features/home/data/constants/type_alias.dart';
import 'package:moomalpublication/features/home/data/models/products_request_data.dart';
import 'package:moomalpublication/features/home/data/services/get_product_services.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
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
      showErrorToast(AppConstants.somethingWentWrong);
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

  void onItemClick(int index, ProductItem data) {
    AppRouting.toNamed(NameRoutes.productDetailScreen,
        argument: SharedData(productItem: data));
  }

  Future<void> onCartBtnClick(ProductItem item) async {
    switch (item.cartBtnType.value) {
      case CartBtnType.addToCart:
        {
          if (item.isBookAvailable || item.isEbookAvailable) {
            final addToCartResponse = await CartServices.addToCart(
              id: _getVariationId(item, item.productVariationType.value),
              quantity: item.quantity.toString(),
              variations: [
                VariationRequestData(
                  attribute: "Purchase",
                  value: (item.productVariationType.value ==
                          ProductVariation.ebook)
                      ? _getVariationValue(
                          item, item.productVariationType.value)
                      : _getVariationValue(
                          item, item.productVariationType.value),
                ),
              ],
            );
            if (addToCartResponse.data != null) {
              showToast(
                "item_added_to_cart".tr,
              );
              item.cartBtnType.value = CartBtnType.goToCart;
              CartController cartController = Get.find<CartController>();
              cartController.onRefresh();
            }
          } else {
            showErrorToast("this_product_is_out_of_stock".tr);
          }
        }
        break;

      case CartBtnType.goToCart:
        AppRouting.offAllNamed(NameRoutes.moomalpublicationApp, argument: 3);
        break;
    }
  }

  String _getVariationId(ProductItem item, ProductVariation value) {
    if (value == ProductVariation.ebook) {
      for (ProductVariations element in item.productVariations!) {
        if (element.attributes?[0].option?.toLowerCase().compareTo("ebook") ==
            0) {
          return element.id!.toString();
        }
      }
    } else {
      for (ProductVariations element in item.productVariations!) {
        if (element.attributes?[0].option?.toLowerCase().compareTo("book") ==
            0) {
          return element.id.toString();
        }
      }
    }

    return "";
  }

  String _getVariationValue(ProductItem item, ProductVariation value) {
    if (value == ProductVariation.ebook) {
      for (ProductVariations element in item.productVariations!) {
        if (element.attributes?[0].option?.toLowerCase().compareTo("ebook") ==
            0) {
          return element.attributes![0].option!;
        }
      }
    } else {
      for (ProductVariations element in item.productVariations!) {
        if (element.attributes?[0].option?.toLowerCase().compareTo("book") ==
            0) {
          return element.attributes![0].option!;
        }
      }
    }

    return "";
  }
}
