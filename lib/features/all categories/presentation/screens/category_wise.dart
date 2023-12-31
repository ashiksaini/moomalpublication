import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/bottom_sheets/filter_bottom_sheet.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/features/all%20categories/controller/category_wise_controller.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

class CategoryWiseScreen extends StatelessWidget {
  CategoryWiseScreen({super.key});

  final CategoryWiseController _categoryWiseController =
      Get.put(CategoryWiseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Obx(() {
          return Column(
            children: [
              _getUpperView(context),
            ],
          );
        }),
      ),
    );
  }

  Widget _getUpperView(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: scaleHeight(110, context),
          padding: EdgeInsets.symmetric(
            horizontal: scaleWidth(12, context),
            vertical: scaleHeight(15, context),
          ),
          decoration: BoxDecoration(
              color: AppColors.greyLight,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(scaleRadius(10, context)),
                bottomRight: Radius.circular(scaleRadius(10, context)),
              ),
              boxShadow: [primaryBoxShadow()]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Include out of stock items
              Row(
                children: [
                  SizedBox(
                    height: scaleHeight(24, context),
                    width: scaleWidth(24, context),
                    child: Checkbox(
                      side: const BorderSide(color: AppColors.white),
                      checkColor: AppColors.orange,
                      activeColor: AppColors.white,
                      value:
                          _categoryWiseController.includeOutOfStockItem.value,
                      onChanged: (value) => _categoryWiseController
                          .canIncludeOutOfStockItem(value),
                    ),
                  ),
                  const HorizontalGap(size: 4),
                  CustomText(
                    text: "include_out_of_stock_item".tr,
                    textStyle: CustomTextStyle.textStyle18Regular(context,
                        color: AppColors.black),
                  ),
                ],
              ),

              // Filter btn
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return Wrap(
                        children: [
                          FiltersBottomSheet(
                            onClick: _categoryWiseController.onFilterItemClick,
                          )
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: scaleWidth(4, context)),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [primaryBoxShadow()],
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppAssets.icFilter2),
                      CustomText(
                        text: "filter".tr,
                        textStyle: CustomTextStyle.textStyle18Bold(context,
                            color: AppColors.black),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        CustomAppbar(
          title:
              _categoryWiseController.sharedData.categoryWiseAppBarTitle ?? "",
          prefixIcon: AppAssets.icBackArrow,
          onPrefixIconClick: () => AppRouting.navigateBack(),
          suffixIcon: AppAssets.icSearch,
          onSuffixIconClick: () => AppRouting.toNamed(NameRoutes.searchScreen),
        ),
      ],
    );
  }
}
