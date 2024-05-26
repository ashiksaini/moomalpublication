import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/base/product_item/product_item.dart';
import 'package:moomalpublication/core/base/product_item/product_variations.dart';
import 'package:moomalpublication/core/base/variation_request_data.dart';
import 'package:moomalpublication/core/constants/enums.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/utils/shared_data.dart';
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:moomalpublication/features/cart/controller/cart_controller.dart';
import 'package:moomalpublication/features/cart/data/services/cart_services.dart';
import 'package:moomalpublication/features/search_books/data/constant/type_alias.dart';
import 'package:moomalpublication/features/search_books/data/services/search_product_services.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class SearchProductController extends BaseController {
  TextEditingController textEditingController = TextEditingController();
  RxString searchedText = RxString("");
  Rx<SearchBooksResponse> searchBookResponse = Rx(ApiResponse());
  RxList<ProductItem> searchedBooks = RxList([]);

  @override
  void onInit() {
    super.onInit();

    debounce(searchedText, (_) => _initDebounce(),
        time: const Duration(seconds: 1));
  }

  void _initDebounce() {
    _getSearchedBook();
  }

  Future<void> _getSearchedBook() async {
    if (searchedText.value.isNotEmpty) {
      searchBookResponse.value = ApiResponse.loading();

      searchBookResponse.value = await SearchProductServices.getSearchedBook(
          search: searchedText.string);
      if (searchBookResponse.value.data != null) {
        if (searchBookResponse.value.data!.isNotEmpty) {
          searchedBooks.addAll(searchBookResponse.value.data!);
        }
      }
    }
  }

  void onTextChanged(String? text) {
    searchedBooks.clear();
    searchedText.value = text!;
  }

  void onItemClick(int index, ProductItem data) {
    AppRouting.toNamed(
      NameRoutes.productDetailScreen,
      argument: SharedData(
        productItem: data,
        backStackRoute: NameRoutes.searchScreen,
      ),
    );
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
                bgColor: AppColors.green,
                textColor: AppColors.white,
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
