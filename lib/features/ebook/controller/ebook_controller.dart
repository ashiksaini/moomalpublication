import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/base/product_item/product_item.dart';
import 'package:moomalpublication/core/base/variation_request_data.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/constants/enums.dart';
import 'package:moomalpublication/core/utils/shared_data.dart';
import 'package:moomalpublication/core/utils/toast.dart';import 'package:moomalpublication/features/cart/data/services/cart_services.dart';
import 'package:moomalpublication/features/ebook/data/constants/type_alias.dart';
import 'package:moomalpublication/features/ebook/data/models/e_book_category_item/e_book_category_item.dart';
import 'package:moomalpublication/features/ebook/data/services/ebooks_services.dart';
import 'package:moomalpublication/features/home/data/constants/type_alias.dart';
import 'package:moomalpublication/features/home/data/models/drop_down_item.dart';
import 'package:moomalpublication/features/home/data/models/products_request_data.dart';
import 'package:moomalpublication/features/home/data/services/get_product_services.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class EbookController extends BaseController {
  Rx<EBookCategoryResponse> ebookCategoryResponse = Rx(ApiResponse());
  final Rx<ProductResponse> ebooksResponse = Rx(ProductResponse());

  RxList<ProductItem> ebooks = RxList();
  List<DropdownItem<EBookCategoryItem>> ebookCategories = RxList();
  late Rx<DropdownItem<EBookCategoryItem>?> selectedCategory = Rx(null);
  RxBool isLastPage = RxBool(false);
  RxBool isLoadingMore = RxBool(false);

  int _pageNo = 1;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();

    _initCategoriesList();
    scrollController.addListener(_scrollListener);
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
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadMoreData();
    }
  }

  Future<void> _initCategoriesList() async {
    ebookCategoryResponse.value = ApiResponse.loading();
    ebookCategoryResponse.value = await EBookServices.getEBookCategories();

    if (ebookCategoryResponse.value.data != null) {
      for (var category in ebookCategoryResponse.value.data!) {
        ebookCategories
            .add(DropdownItem(title: category.name ?? "", type: category));
      }

      if (ebookCategories.isNotEmpty) {
        selectedCategory.value = ebookCategories.first;

        _getCategoryWiseBooks();
      }
    }
  }

  Future<void> _getCategoryWiseBooks() async {
    if (_pageNo < 2) {
      ebooksResponse.value = ApiResponse.loading();
    }

    isLoadingMore.value = false;
    ebooksResponse.value = await GetProductServices.getProducts(
      query: _getQueryParams(
        perPage: 20,
        category: selectedCategory.value?.type.id,
      ),
    );
    if (ebooksResponse.value.data != null) {
      ebooks.addAll(ebooksResponse.value.data ?? []);
    } else {
      showToast(AppConstants.somethingWentWrong);
    }
  }

  Map<String, dynamic> _getQueryParams(
      {int? category, String? orderBy, String? order, int? perPage}) {
    return ProductRequestData(
      category: category,
      orderBy: orderBy,
      order: order,
      perPage: perPage,
      page: _pageNo,
    ).toJson();
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
              id: item.id.toString(),
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
              item.cartBtnType.value = CartBtnType.goToCart;
            }
          } else {
            showToast("this_product_is_out_of_stock".tr);
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
        if (element.attributes?.attributePurchase
                ?.toLowerCase()
                .compareTo("ebook") ==
            0) {
          return element.attributes!.attributePurchase!;
        }
      }
    } else {
      for (var element in item.variations!) {
        if (element.attributes?.attributePurchase
                ?.toLowerCase()
                .compareTo("book") ==
            0) {
          return element.attributes!.attributePurchase!;
        }
      }
    }

    return "";
  }

  void onCategoryItemClick(DropdownItem<EBookCategoryItem> item) {
    selectedCategory.value = item;
    ebooks.clear();
    _getCategoryWiseBooks();
  }

  Future<void> onRefresh() async {
    _pageNo = 1;
    isLastPage.value = false;

    ebooks.clear();
    _getCategoryWiseBooks();
  }
}
