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
      borderRadius: BorderRadius.circular(scaleRadius(10, context)),
    ),
    child: Container(
      height: scaleHeight(290, context),
      width: scaleWidth(200, context),
      padding: EdgeInsets.symmetric(
        vertical: scaleHeight(10, context),
        horizontal: scaleWidth(10, context),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(scaleRadius(10, context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            animation,
            fit: BoxFit.contain,
            height: scaleHeight(200, context),
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
