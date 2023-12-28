import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/all%20categories/presentation/widgets/category.dart';
import 'package:moomalpublication/routes/routing.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              title: "All Categories",
              prefixIcon: AppAssets.icBackArrow,
              onPrefixIconClick: () => AppRouting.navigateBack(),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                vertical: scaleHeight(50, context),
                horizontal: scaleWidth(24, context),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CategoryItem(
                          icon: AppAssets.icReadingBook,
                          title: "current_gk".tr),
                      CategoryItem(
                          icon: AppAssets.icUserboard,
                          title: "rajasthan_gk".tr),
                    ],
                  ),
                  const VerticalGap(size: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CategoryItem(
                          icon: AppAssets.icClipboard, title: "exam_review".tr),
                      CategoryItem(
                          icon: AppAssets.icEdit, title: "reet_exam".tr),
                    ],
                  ),
                  const VerticalGap(size: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CategoryItem(
                          icon: AppAssets.icOpenBook, title: "new_books".tr),
                      CategoryItem(
                          icon: AppAssets.icReport, title: "model_papers".tr),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
