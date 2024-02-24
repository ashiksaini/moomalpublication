import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/splash/controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key}) {
    Get.put(SplashController());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 180.v),
      child: Center(
        child: Column(
          children: [
            // Logo
            SvgPicture.asset(
              AppAssets.icLogo,
              height: 195.v,
              width: 195.h,
            ),
            const VerticalGap(size: 80),

            // Find it
            CustomText(
              text: "find_it".tr,
              textStyle: CustomTextStyle.textStyle40BoldMina(context,
                  color: AppColors.greyDark),
            ),
            const VerticalGap(size: 10),

            // Yourselft
            CustomText(
              text: "yourself".tr,
              textStyle: CustomTextStyle.textStyle60BoldMontaguSlab(
                context,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
