import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';

void showLottieDialog(BuildContext context, String animation, String title) {
  Get.dialog(Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Container(
      height: 290.v,
      width: 200.h,
      padding: EdgeInsets.symmetric(
        vertical: 10.v,
        horizontal: 10.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            animation,
            fit: BoxFit.contain,
            height: 200.v,
          ),
          const VerticalGap(size: 20),
          CustomText(
            text: title,
            textStyle: CustomTextStyle.textStyle20Bold(
              context,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    ),
  ));

  Future.delayed(const Duration(seconds: 2), () {
    Get.back();
  });
}
