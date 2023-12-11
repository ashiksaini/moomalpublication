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
      width: screenWidth(context),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(scaleRadius(10, context)),
          topRight: Radius.circular(scaleRadius(10, context)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: scaleHeight(14, context),
              horizontal: scaleWidth(14, context),
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
                  width: screenWidth(context) - scaleWidth(40, context),
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
            width: screenWidth(context),
            padding: EdgeInsets.symmetric(vertical: scaleHeight(8, context)),
            color: AppColors.orange,
            child: CustomText(
              text: "apply_filter".tr,
              textStyle: CustomTextStyle.textStyle22Bold(context, color: AppColors.white),
            ),
          )
        ],
      ),
    );
  }
}
