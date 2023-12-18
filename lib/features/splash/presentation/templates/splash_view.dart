import 'package:flutter/material.dart';
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
      padding: EdgeInsets.only(top: scaleHeight(180, context)),
      child: Center(
        child: Column(
          children: [
            // Logo
            Image.asset(
              AppAssets.icLogo1,
              height: scaleHeight(195, context),
              width: scaleWidth(195, context),
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
            FittedBox(
              child: CustomText(
                text: "yourself".tr,
                textStyle: CustomTextStyle.textStyle60BoldMontaguSlab(context,
                    color: AppColors.white,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
