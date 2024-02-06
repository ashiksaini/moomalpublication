import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/shared_data.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/all_categories/presentation/widgets/category.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Container(
          color: AppColors.white,
          child: Column(
            children: [
              CustomAppbar(
                title: "all_categories".tr,
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
                        // Current Gk
                        _getCategoryItem(
                          "current_gk".tr,
                          AppAssets.icReadingBook,
                          SharedData(
                            categoryWiseAppBarTitle: "current_gk".tr,
                            categoryId: AppConstants.currentGKCategoryId,
                          ),
                        ),
          
                        // Rajasthan GK
                        _getCategoryItem(
                          "rajasthan_gk".tr,
                          AppAssets.icUserboard,
                          SharedData(
                            categoryWiseAppBarTitle: "rajasthan_gk".tr,
                            categoryId: AppConstants.rajasthanGKCategoryId,
                          ),
                        ),
                      ],
                    ),
                    const VerticalGap(size: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Exam Review
                        _getCategoryItem(
                          "exam_review".tr,
                          AppAssets.icClipboard,
                          SharedData(
                            categoryWiseAppBarTitle: "exam_review".tr,
                            categoryId: AppConstants.examReviewCategoryId,
                          ),
                        ),
          
                        // Reet Exam
                        _getCategoryItem(
                          "reet_exam".tr,
                          AppAssets.icEdit,
                          SharedData(
                            categoryWiseAppBarTitle: "reet_exam".tr,
                            categoryId: AppConstants.reetExamCategoryId,
                          ),
                        ),
                      ],
                    ),
                    const VerticalGap(size: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // New Books
                        _getCategoryItem(
                          "new_books".tr,
                          AppAssets.icOpenBook,
                          SharedData(
                            categoryWiseAppBarTitle: "new_books".tr,
                            categoryId: AppConstants.newBookCategoryId,
                          ),
                        ),
          
                        // New Books
                        _getCategoryItem(
                          "model_papers".tr,
                          AppAssets.icReport,
                          SharedData(
                            categoryWiseAppBarTitle: "model_papers".tr,
                            categoryId: AppConstants.modalPaperCategoryId,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getCategoryItem(String title, String icon, SharedData sharedData) {
    return CategoryItem(
      onClick: () => AppRouting.toNamed(
        NameRoutes.categoryWiseScreen,
        argument: sharedData,
      ),
      icon: icon,
      title: title,
    );
  }
}
