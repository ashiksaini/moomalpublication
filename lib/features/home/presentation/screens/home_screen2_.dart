import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/box_decorations.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/all_categories/presentation/widgets/category.dart';
import 'package:moomalpublication/features/home/controllers/home_controller.dart';
import 'package:moomalpublication/features/home/presentation/widgets/custom_navigation_drawer.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

class HomeScreen2 extends StatelessWidget {
  HomeScreen2({super.key});

  final HomeController _homeController =
      Get.put(HomeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homeController.globalKey,
      drawer: CustomNavigationDrawer(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 14.v, horizontal: 14.h),
        height: SizeUtils.height,
        width: SizeUtils.width,
        decoration: BoxDecoration(
          gradient: gradientBg(context),
        ),
        child: SafeArea(
            child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () =>
                    _homeController.globalKey.currentState!.openDrawer(),
                child: SvgPicture.asset(AppAssets.icHamburger),
              ),
            ),
            const VerticalGap(size: 20),
            SvgPicture.asset(
              AppAssets.icLogo,
              height: 190.v,
              width: 190.h,
            ),
            const VerticalGap(size: 40),
            CustomText(
              text: "select_category".tr,
              textStyle: CustomTextStyle.textStyle26BoldCaladea(
                context,
                color: AppColors.white,
              ),
            ),
            const VerticalGap(size: 40),
            Row(
              children: [
                Expanded(
                  child: CategoryItem(
                    icon: AppAssets.icReadingBook,
                    title: "ebook_purchased".tr,
                    textStyle: CustomTextStyle.textStyle20BoldCaladea(
                      context,
                      color: AppColors.black,
                    ),
                    onClick: () => AppRouting.toNamed(NameRoutes.eBookScreen),
                  ),
                ),
                Expanded(
                  child: CategoryItem(
                    icon: AppAssets.icUserboard,
                    title: "book_purchased".tr,
                    textStyle: CustomTextStyle.textStyle20BoldCaladea(
                      context,
                      color: AppColors.black,
                    ),
                    onClick: () => AppRouting.offAllNamed(
                      NameRoutes.moomalpublicationApp,
                      argument: 1,
                    ),
                  ),
                ),
                Expanded(
                  child: CategoryItem(
                    icon: AppAssets.icClipboard,
                    title: "latest_news".tr,
                    textStyle: CustomTextStyle.textStyle20BoldCaladea(
                      context,
                      color: AppColors.black,
                    ),
                    onClick: () => AppRouting.toNamed(
                      NameRoutes.latestNewsScreen
                    ),
                  ),
                ),
              ],
            ),
            const VerticalGap(size: 30),
            Row(
              children: [
                Expanded(
                  child: CategoryItem(
                    icon: AppAssets.icEdit,
                    title: "daily_quiz".tr,
                    textStyle: CustomTextStyle.textStyle20BoldCaladea(
                      context,
                      color: AppColors.black,
                    ),
                    onClick: () => AppRouting.toNamed(NameRoutes.quizScreen),
                  ),
                ),
                Expanded(
                  child: CategoryItem(
                    icon: AppAssets.icOpenBook,
                    title: "test_series".tr,
                    textStyle: CustomTextStyle.textStyle20BoldCaladea(
                      context,
                      color: AppColors.black,
                    ),
                    onClick: () =>
                        AppRouting.toNamed(NameRoutes.testSeriesScreen),
                  ),
                ),
                Expanded(
                  child: CategoryItem(
                    icon: AppAssets.icReport,
                    title: "subscribe_now".tr,
                    textStyle: CustomTextStyle.textStyle20BoldCaladea(
                      context,
                      color: AppColors.black,
                    ),
                    onClick: () =>
                        AppRouting.toNamed(NameRoutes.subscribeNowScreen),
                  ),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
