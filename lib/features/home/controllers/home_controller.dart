import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/utils/shared_data.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/home/data/constants/drawer_item_type.dart';
import 'package:moomalpublication/features/home/data/constants/type_alias.dart';
import 'package:moomalpublication/core/base/product_item/product_item.dart';
import 'package:moomalpublication/features/home/data/models/drawer_item.dart';
import 'package:moomalpublication/features/home/data/models/products_request_data.dart';
import 'package:moomalpublication/features/home/data/services/get_product_services.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class HomeController extends BaseController {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey();
  final Rx<ProductResponse> exploreProductResponse = Rx(ProductResponse());
  final Rx<ProductResponse> newArrivalProductResponse = Rx(ProductResponse());
  final Rx<ProductResponse> bestSellerProductResponse = Rx(ProductResponse());

  RxList<ProductItem> exploreProductList = RxList([]);
  RxList<ProductItem> newArrivalProductList = RxList([]);
  RxList<ProductItem> bestSellerProductList = RxList([]);

  List<DrawerItem> drawerItems = [];

  @override
  void onInit() {
    super.onInit();

    _initDrawerItemList();
    _getExploreBooks();
    _getNewArrivalBooks();
    _getBestSellerBooks();
  }

  void _initDrawerItemList() {
    final downloadItem = DrawerItem(icon: AppAssets.icDownload, title: "downloads".tr, drawerItemType: DrawerItemType.download);
    final addressItem = DrawerItem(icon: AppAssets.icAddress, title: "addresses".tr, drawerItemType: DrawerItemType.address);
    final orderItem = DrawerItem(icon: AppAssets.icOrder, title: "orders".tr, drawerItemType: DrawerItemType.orders);
    final eventAndPressReleaseItem = DrawerItem(icon: AppAssets.icEventAndPressRelease, title: "event_and_press_release".tr, drawerItemType: DrawerItemType.eventsAndPressRelease);
    final testimonialItem = DrawerItem(icon: AppAssets.icTestimonial, title: "testimonial".tr, drawerItemType: DrawerItemType.testimonial);
    final quizItem = DrawerItem(icon: AppAssets.icQuiz, title: "quiz".tr, drawerItemType: DrawerItemType.quiz);
    final contactUsItem = DrawerItem(icon: AppAssets.icContactUs, title: "contact_us".tr, drawerItemType: DrawerItemType.contactUs);
    final settingItem = DrawerItem(icon: AppAssets.icSettings, title: "setting".tr, drawerItemType: DrawerItemType.settings);
    final onlineTestSeriesItem = DrawerItem(icon: AppAssets.icReadingBook, title: "online_test_series".tr, drawerItemType: DrawerItemType.onlineTestSeries);
    final overallResultItem = DrawerItem(icon: AppAssets.icReport, title: "overall_result".tr, drawerItemType: DrawerItemType.overallResult);
    final logoutItem = DrawerItem(icon: AppAssets.icLogout, title: "logout".tr, drawerItemType: DrawerItemType.logout);

    drawerItems.addAll([
      downloadItem,
      addressItem,
      orderItem,
      eventAndPressReleaseItem,
      testimonialItem,
      quizItem,
      contactUsItem,
      settingItem,
      onlineTestSeriesItem,
      overallResultItem,
      logoutItem,
    ]);
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

  void onItemClick(int index, ProductItem data) {
    AppRouting.toNamed(NameRoutes.productDetailScreen, argument: SharedData(productId: data.id, productName: data.name));
  }

  void onDrawerItemClick(DrawerItemType drawerItemType) {
    globalKey.currentState!.closeDrawer();
    
    switch (drawerItemType) {
      case DrawerItemType.download:
      // TODO: Handle this case.
      case DrawerItemType.address:
      // TODO: Handle this case.
      case DrawerItemType.orders:
      // TODO: Handle this case.
      case DrawerItemType.eventsAndPressRelease:
      // TODO: Handle this case.
      case DrawerItemType.testimonial:
        AppRouting.toNamed(NameRoutes.testimonialScreen);
        break;
      case DrawerItemType.quiz:
      // TODO: Handle this case.
      case DrawerItemType.contactUs:
      // TODO: Handle this case.
      case DrawerItemType.settings:
      // TODO: Handle this case.
      case DrawerItemType.onlineTestSeries:
      // TODO: Handle this case.
      case DrawerItemType.overallResult:
      // TODO: Handle this case.
      case DrawerItemType.logout:
      // TODO: Handle this case.
    }
  }
}
