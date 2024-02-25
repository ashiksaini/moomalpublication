import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/custom_drop_down_2.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/home/controllers/home_controller.dart';

class AdvanceFilterBottomSheet extends StatelessWidget {
  AdvanceFilterBottomSheet({super.key});

  final HomeController _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeUtils.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 14.v,
              horizontal: 14.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "advance_filters".tr,
                  textStyle: CustomTextStyle.textStyle25Bold(context),
                  textAlign: TextAlign.start,
                ),
                const VerticalGap(size: 15),
                CustomText(
                  text: "language".tr,
                  textStyle: CustomTextStyle.textStyle25Bold(context),
                  textAlign: TextAlign.start,
                ),
                const VerticalGap(size: 5),
                CustomDropDown2(
                  items: _homeController.languages,
                  selectedItem: _homeController.selectedLanguage,
                  onItemClick: _homeController.onLanguageItemClick,
                  width: SizeUtils.width - 40.h,
                ),
                const VerticalGap(size: 15),
                CustomText(
                  text: "course_type".tr,
                  textStyle: CustomTextStyle.textStyle25Bold(context),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Container(
            width: SizeUtils.width,
            padding: EdgeInsets.symmetric(vertical: 8.v),
            color: AppColors.orange,
            child: CustomText(
              text: "apply_filter".tr,
              textStyle: CustomTextStyle.textStyle22Bold(context,
                  color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
