import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/components/template/screen.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/home/controllers/home_controller.dart';
import 'package:moomalpublication/features/home/presentation/template/dashboard_books_view.dart';
import 'package:moomalpublication/features/home/presentation/widgets/custom_filter_bar.dart';
import 'package:moomalpublication/features/home/presentation/widgets/custom_navigation_drawer.dart';
import 'package:moomalpublication/features/home/presentation/widgets/main_category_card.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

class HomeScreen extends StatelessWidget {
  final HomeController _homeController =
      Get.put(HomeController(), permanent: true);

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Screen(
        isAppbarVisible: false,
        scaffoldKey: _homeController.globalKey,
        drawer: CustomNavigationDrawer(),
        onRefresh: () => _homeController.onRefresh(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Upper view
            Stack(
              children: [
                _getGreyBg(context),
                _getMainAppbar(context),
                _getMainCategories(context),
                // _getFilterBar(context),
              ],
            ),

            // Explore view
            DashboardBooksView(
              title: "explore".tr,
              loadingItemCount: 6,
              isLoading: _homeController.exploreProductResponse.value.isLoading,
              data: _homeController.exploreProductList,
            ),

            // New Arrival view
            DashboardBooksView(
              title: "new_arrival".tr,
              loadingItemCount: 4,
              isLoading:
                  _homeController.newArrivalProductResponse.value.isLoading,
              data: _homeController.newArrivalProductList,
            ),

            // Best Seller view
            DashboardBooksView(
              title: "best_seller".tr,
              loadingItemCount: 4,
              isLoading:
                  _homeController.bestSellerProductResponse.value.isLoading,
              data: _homeController.bestSellerProductList,
            ),
          ],
        ),
      );
    });
  }

  Widget _getGreyBg(BuildContext context) {
    return Container(
      height: SizeUtils.height / 3.4,
      decoration: BoxDecoration(
        color: AppColors.greyLight,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
    );
  }

  Widget _getMainAppbar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20.v,
        bottom: 100.v,
      ),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      child: CustomAppbar(
        title: "moomalpublication".tr,
        prefixIcon: AppAssets.icHamburger,
        suffixIcon: AppAssets.icSearch,
        onPrefixIconClick: () =>
            _homeController.globalKey.currentState!.openDrawer(),
        onSuffixIconClick: () => AppRouting.toNamed(NameRoutes.searchScreen),
      ),
    );
  }

  Widget _getMainCategories(BuildContext context) {
    return Positioned(
      top: 90.v,
      child: SizedBox(
        width: SizeUtils.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MainCategoryCard(
              icon: AppAssets.icGrid,
              title: "category".tr,
              onClick: () => AppRouting.toNamed(NameRoutes.allCategoryScreen),
            ),
            MainCategoryCard(
              icon: AppAssets.icBook,
              title: "ebooks".tr,
              onClick: () => AppRouting.offAllNamed(
                  NameRoutes.moomalpublicationApp,
                  argument: 2),
            ),
            MainCategoryCard(
              icon: AppAssets.icReport,
              title: "test_series".tr,
              onClick: () => AppRouting.toNamed(NameRoutes.testSeriesScreen),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getFilterBar(BuildContext context) {
    return Positioned(
      bottom: 30.v,
      left: 12.h,
      right: 12.h,
      child: CustomFilterBar(),
    );
  }
}
