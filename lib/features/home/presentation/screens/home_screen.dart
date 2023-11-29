import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/components/organisms/card_book_item.dart';
import 'package:moomalpublication/core/components/templates/screen.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/home/presentation/widgets/custom_filter_bar.dart';
import 'package:moomalpublication/features/home/presentation/widgets/custom_navigation_drawer.dart';
import 'package:moomalpublication/features/home/presentation/widgets/main_category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      drawer: const CustomNavigationDrawer(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              _getGreyBg(context),
              _getMainAppbar(context),
              _getMainCategories(context),
              _getFilterBar(context),
            ],
          ),
          const VerticalGap(size: 30),
          _getTitle(context, "explore".tr),
          const VerticalGap(size: 15),
          _getBooksBuilder(context, 6),
          const VerticalGap(size: 30),
          _getTitle(context, "new_arrival".tr),
          const VerticalGap(size: 15),
          _getBooksBuilder(context, 4),
        ],
      ),
    );
  }

  Widget _getGreyBg(BuildContext context) {
    return Container(
      height: screenHeight(context) / 2.2,
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
      child: const CustomAppbar(
        title: "title",
        prefixIcon: AppAssets.icHamburger,
        suffixIcon: AppAssets.icSearch,
      ),
    );
  }

  Widget _getMainCategories(BuildContext context) {
    return Positioned(
      top: 120,
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
      child: const CustomFilterBar());
  }

  Widget _getTitle(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: scaleWidth(20, context)),
      child: CustomText(
        text: title,
        textStyle: CustomTextStyle.textStyle25Bold(context, color: AppColors.black),
      ),
    );
  }

  Widget _getBooksBuilder(BuildContext context, int itemCount) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: scaleWidth(10, context)),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 0.49,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return const CardBookItem();
        },
      ),
    );
  }
}
