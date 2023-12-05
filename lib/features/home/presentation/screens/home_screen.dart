import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/components/templates/screen.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/home/controllers/home_controller.dart';
import 'package:moomalpublication/features/home/presentation/templates/dashboard_books_view.dart';
import 'package:moomalpublication/features/home/presentation/widgets/custom_filter_bar.dart';
import 'package:moomalpublication/features/home/presentation/widgets/custom_navigation_drawer.dart';
import 'package:moomalpublication/features/home/presentation/widgets/main_category_card.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

class HomeScreen extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Screen(
        isAppbarVisible: false,
        scaffoldKey: _globalKey,
        drawer: const CustomNavigationDrawer(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Upper view
            Stack(
              children: [
                _getGreyBg(context),
                _getMainAppbar(context),
                _getMainCategories(context),
                _getFilterBar(context),
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
              isLoading: _homeController.newArrivalProductResponse.value.isLoading,
              data: _homeController.newArrivalProductList,
            ),

            // Best Seller view
            DashboardBooksView(
              title: "best_seller".tr,
              loadingItemCount: 4,
              isLoading: _homeController.bestSellerProductResponse.value.isLoading,
              data: _homeController.bestSellerProductList,
            ),
          ],
        ),
      );
    });
  }

  Widget _getGreyBg(BuildContext context) {
    return Container(
      height: screenHeight(context) / 2.3,
      decoration: BoxDecoration(
        color: AppColors.greyLight,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(scaleRadius(20, context)),
          bottomRight: Radius.circular(scaleRadius(20, context)),
        ),
      ),
    );
  }

  Widget _getMainAppbar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: scaleHeight(40, context), bottom: scaleHeight(60, context)),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(scaleRadius(20, context)),
          bottomRight: Radius.circular(scaleRadius(20, context)),
        ),
      ),
      child: CustomAppbar(
        title: "moomalpublication".tr,
        prefixIcon: AppAssets.icHamburger,
        suffixIcon: AppAssets.icSearch,
        onPrefixIconClick: () => _globalKey.currentState!.openDrawer(),
        onSuffixIconClick: () => AppRouting.toNamed(NameRoutes.searchScreen),
      ),
    );
  }

  Widget _getMainCategories(BuildContext context) {
    return Positioned(
      top: scaleHeight(100, context),
      child: SizedBox(
        width: screenWidth(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MainCategoryCard(icon: AppAssets.icGrid, title: "category".tr),
            MainCategoryCard(icon: AppAssets.icBook, title: "ebooks".tr),
            MainCategoryCard(icon: AppAssets.icReport, title: "test_series".tr),
          ],
        ),
      ),
    );
  }

  Widget _getFilterBar(BuildContext context) {
    return Positioned(
      bottom: scaleHeight(30, context),
      left: scaleWidth(12, context),
      right: scaleWidth(12, context),
      child: const CustomFilterBar(),
    );
  }
}
