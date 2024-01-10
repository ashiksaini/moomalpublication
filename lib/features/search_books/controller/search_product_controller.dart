import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_rx/src/rx_workers/rx_workers.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/base/product_item/product_item.dart';
import 'package:moomalpublication/core/base/variation_request_data.dart';
import 'package:moomalpublication/core/constants/enums.dart';
import 'package:moomalpublication/core/utils/shared_data.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
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

    debounce(searchedText, (_) => _initDebounce(), time: const Duration(seconds: 1));
  }

  void _initDebounce() {
    _getSearchedBook();
  }

  Future<void> _getSearchedBook() async {
    if (searchedText.value.isNotEmpty) {
      searchBookResponse.value = ApiResponse.loading();

      searchBookResponse.value = await SearchProductServices.getSearchedBook(search: searchedText.string);
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
              id: item.id.toString(),
              quantity: item.quantity.toString(),
              variations: [
                VariationRequestData(
                  attribute: "Purchase",
                  value: (item.productVariationType.value == ProductVariation.ebook) ? _getVariationValue(item, item.productVariationType.value) : _getVariationValue(item, item.productVariationType.value),
                ),
              ],
            );
            if (addToCartResponse.data != null) {
              item.cartBtnType.value = CartBtnType.goToCart;
            }
          } else {
            showSnackBar("this_product_is_out_of_stock".tr);
          }
        }
        break;

      case CartBtnType.goToCart:
        AppRouting.offAllNamed(NameRoutes.moomalpublicationApp, argument: 3);
        break;
    }
  }

  String _getVariationValue(ProductItem item, ProductVariation value) {
    if (value == ProductVariation.ebook) {
      for (var element in item.variations!) {
        if (element.attributes?.attributePurchase?.toLowerCase().compareTo("ebook") == 0) {
          return element.attributes!.attributePurchase!;
        }
      }
    } else {
      for (var element in item.variations!) {
        if (element.attributes?.attributePurchase?.toLowerCase().compareTo("book") == 0) {
          return element.attributes!.attributePurchase!;
        }
      }
    }

    return "";
  }
}
