import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/base/variation_request_data.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/constants/enums.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/utils/shared_data.dart';
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:moomalpublication/features/cart/data/services/cart_services.dart';
import 'package:moomalpublication/features/home/data/constants/drawer_item_type.dart';
import 'package:moomalpublication/features/home/data/constants/drop_down_item_type.dart';
import 'package:moomalpublication/features/home/data/constants/type_alias.dart';
import 'package:moomalpublication/core/base/product_item/product_item.dart';
import 'package:moomalpublication/features/home/data/models/drawer_item.dart';
import 'package:moomalpublication/features/home/data/models/drop_down_item.dart';
import 'package:moomalpublication/features/home/data/models/products_request_data.dart';
import 'package:moomalpublication/features/home/data/services/get_product_services.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';
import 'package:moomalpublication/services/storage/shared_preferences_helper.dart';
import 'package:moomalpublication/services/storage/shared_preferences_keys.dart';

class HomeController extends BaseController {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey();
  final Rx<ProductResponse> exploreProductResponse = Rx(ProductResponse());
  final Rx<ProductResponse> newArrivalProductResponse = Rx(ProductResponse());
  final Rx<ProductResponse> bestSellerProductResponse = Rx(ProductResponse());

  RxList<ProductItem> exploreProductList = RxList([]);
  RxList<ProductItem> newArrivalProductList = RxList([]);
  RxList<ProductItem> bestSellerProductList = RxList([]);
  late Rx<DropdownItem<ExamType>?> selectedExam = Rx(null);
  late Rx<DropdownItem<BookType>?> selectedBook = Rx(null);
  late Rx<DropdownItem<Language>?> selectedLanguage = Rx(null);

  List<DrawerItem> drawerItems = [];
  List<DropdownItem<ExamType>> exams = [];
  List<DropdownItem<BookType>> books = [];
  List<DropdownItem<Language>> languages = [];

  RxString userName = RxString("");
  RxString userAvatar = RxString("");

  @override
  void onInit() {
    super.onInit();

    _getUserInfo();

    _initDrawerItemList();
    _initExamsList();
    _initBookTypeList();
    _initLanguagesList();

    _getExploreBooks();
    _getNewArrivalBooks();
    _getBestSellerBooks();
  }

  Future<void> _getUserInfo() async {
    userName.value = await SharedPreferencesHelper.getString(
            SharedPreferenceKeys.username) ??
        "";
    userAvatar.value = await SharedPreferencesHelper.getString(
            SharedPreferenceKeys.avatarUrl) ??
        "";
  }

  void _initDrawerItemList() {
    // final downloadItem = DrawerItem(
    //   icon: AppAssets.icDownload,
    //   title: "downloads".tr,
    //   drawerItemType: DrawerItemType.download,
    // );
    final addressItem = DrawerItem(
      icon: AppAssets.icAddress,
      title: "addresses".tr,
      drawerItemType: DrawerItemType.address,
    );
    final orderItem = DrawerItem(
      icon: AppAssets.icOrder,
      title: "orders".tr,
      drawerItemType: DrawerItemType.orders,
    );
    final eventAndPressReleaseItem = DrawerItem(
      icon: AppAssets.icEventAndPressRelease,
      title: "event_and_press_release".tr,
      drawerItemType: DrawerItemType.eventsAndPressRelease,
    );
    final testimonialItem = DrawerItem(
      icon: AppAssets.icTestimonial,
      title: "testimonial".tr,
      drawerItemType: DrawerItemType.testimonial,
    );
    // final quizItem = DrawerItem(
    //   icon: AppAssets.icQuiz,
    //   title: "quiz".tr,
    //   drawerItemType: DrawerItemType.quiz,
    // );
    final contactUsItem = DrawerItem(
      icon: AppAssets.icContactUs,
      title: "contact_us".tr,
      drawerItemType: DrawerItemType.contactUs,
    );
    final settingItem = DrawerItem(
      icon: AppAssets.icSettings,
      title: "setting".tr,
      drawerItemType: DrawerItemType.settings,
    );
    // final onlineTestSeriesItem = DrawerItem(
    //   icon: AppAssets.icReadingBook,
    //   title: "online_test_series".tr,
    //   drawerItemType: DrawerItemType.onlineTestSeries,
    // );
    // final overallResultItem = DrawerItem(
    //     icon: AppAssets.icReport,
    //     title: "overall_result".tr,
    //     drawerItemType: DrawerItemType.overallResult);
    final logoutItem = DrawerItem(
      icon: AppAssets.icLogout,
      title: "logout".tr,
      drawerItemType: DrawerItemType.logout,
    );

    drawerItems.addAll([
      // downloadItem,
      addressItem,
      orderItem,
      eventAndPressReleaseItem,
      testimonialItem,
      // quizItem,
      contactUsItem,
      settingItem,
      // onlineTestSeriesItem,
      // overallResultItem,
      logoutItem,
    ]);
  }

  void _initExamsList() {
    final allIndiaExam =
        DropdownItem(title: "all_india_exam".tr, type: ExamType.allIndiaExam);
    final rajasthanExam =
        DropdownItem(title: "rajasthan_exam".tr, type: ExamType.rajasthanExam);

    exams.addAll([allIndiaExam, rajasthanExam]);
    selectedExam.value = exams.first;
  }

  void _initBookTypeList() {
    final gk = DropdownItem(title: "gk".tr, type: BookType.gk);
    final currentGk =
        DropdownItem(title: "current_gk".tr, type: BookType.currentGk);
    final reetExam =
        DropdownItem(title: "reet_exam".tr, type: BookType.reetExam);

    books.addAll([gk, currentGk, reetExam]);
    selectedBook.value = books.first;
  }

  void _initLanguagesList() {
    final english = DropdownItem(title: "english".tr, type: Language.english);
    final hindi = DropdownItem(title: "hindi".tr, type: Language.hindi);

    languages.addAll([english, hindi]);
    selectedLanguage.value = languages.first;
  }

  Future<void> _getExploreBooks() async {
    exploreProductResponse.value = ApiResponse.loading();
    exploreProductResponse.value = await GetProductServices.getProducts(
        query: _getQueryParams(perPage: 6));

    if (exploreProductResponse.value.data != null) {
      exploreProductList.addAll(exploreProductResponse.value.data ?? []);
    } else {
      showToast(AppConstants.somethingWentWrong);
    }
  }

  Future<void> _getNewArrivalBooks() async {
    newArrivalProductResponse.value = ApiResponse.loading();
    newArrivalProductResponse.value = await GetProductServices.getProducts(
        query: _getQueryParams(perPage: 4, orderBy: "date", order: "desc"));

    if (newArrivalProductResponse.value.data != null) {
      newArrivalProductList.addAll(newArrivalProductResponse.value.data ?? []);
    } else {
      showToast(AppConstants.somethingWentWrong);
    }
  }

  Future<void> _getBestSellerBooks() async {
    bestSellerProductResponse.value = ApiResponse.loading();
    bestSellerProductResponse.value = await GetProductServices.getProducts(
        query:
            _getQueryParams(perPage: 4, orderBy: "popularity", order: "desc"));

    if (bestSellerProductResponse.value.data != null) {
      bestSellerProductList.addAll(bestSellerProductResponse.value.data ?? []);
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
              showToast(
                "item_added_to_cart".tr,
                bgColor: AppColors.green,
                textColor: AppColors.white,
              );
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

  Future<void> onProductVariationClick(
    ProductItem item,
    ProductVariation variation,
  ) async {
    item.productVariationType.value = variation;
  }

  void onDrawerItemClick(DrawerItemType drawerItemType) {
    globalKey.currentState!.closeDrawer();

    switch (drawerItemType) {
      case DrawerItemType.download:
        AppRouting.toNamed(NameRoutes.downloadScreen);
        break;
      case DrawerItemType.address:
        AppRouting.toNamed(NameRoutes.addressesScreen);
        break;
      case DrawerItemType.orders:
        AppRouting.toNamed(NameRoutes.orderScreen);
        break;
      case DrawerItemType.eventsAndPressRelease:
        AppRouting.toNamed(NameRoutes.eventAndPressReleaseScreen);
        break;
      case DrawerItemType.testimonial:
        AppRouting.toNamed(NameRoutes.testimonialScreen);
        break;
      case DrawerItemType.quiz:
        AppRouting.toNamed(NameRoutes.quizScreen);
        break;
      case DrawerItemType.contactUs:
        AppRouting.toNamed(NameRoutes.contactUsScreen);
        break;
      case DrawerItemType.settings:
        AppRouting.toNamed(NameRoutes.settingsScreen);
        break;
      case DrawerItemType.onlineTestSeries:
        AppRouting.toNamed(NameRoutes.onlineTestSeriesScreen);
        break;
      case DrawerItemType.overallResult:
        AppRouting.toNamed(NameRoutes.overallResultScreen);
        break;
      case DrawerItemType.logout:
        {
          SharedPreferencesHelper.clearSharedPrefExcept();
          AppRouting.offAllNamed(NameRoutes.splashScreen);
        }

        break;
    }
  }

  void onLanguageItemClick(DropdownItem<Language> item) {
    selectedLanguage.value = item;
  }

  Future<void> onRefresh() async {
    exploreProductList.clear();
    newArrivalProductList.clear();
    bestSellerProductList.clear();

    _getExploreBooks();
    _getNewArrivalBooks();
    _getBestSellerBooks();
  }
}
