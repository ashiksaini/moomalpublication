import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/auth/controllers/reset_password_on_success_controller.dart';

class ResetPasswordOnSuccessView extends StatelessWidget {
  ResetPasswordOnSuccessView({super.key}) {
    Get.put(ResetPasswordOnSuccessController());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: scaleWidth(24, context),
        right: scaleWidth(24, context),
        top: scaleHeight(80, context),
      ),
      child: Column(
        children: [
          // Logo
          _getLogo(context),
          const VerticalGap(size: 70),

          // Reset Password On Success
          _getResetPasswordOnSuccessText(context),
          const VerticalGap(size: 40),

          // Reset Password On Success Desc
          _getResetPasswordOnSuccessDesc(context),
          const VerticalGap(size: 45),
        ],
      ),
    );
  }

  Widget _getLogo(BuildContext context) {
    return Image.asset(
      AppAssets.icLogo1,
      height: scaleHeight(195, context),
      width: scaleWidth(195, context),
    );
  }

  Widget _getResetPasswordOnSuccessText(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: scaleWidth(10, context),
        vertical: scaleHeight(20, context),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(
          scaleRadius(20, context),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppAssets.icTick),
          const HorizontalGap(size: 4),
          CustomText(
            text: "reset_password_on_success".tr,
            textStyle: CustomTextStyle.textStyle18Bold(context, color: AppColors.black),
          )
        ],
      ),
    );
  }

  Widget _getResetPasswordOnSuccessDesc(BuildContext context) {
    return CustomText(
      text: "reset_password_on_success_desc".tr,
      textStyle: CustomTextStyle.textStyle18Bold(context, color: AppColors.white),
      textAlign: TextAlign.start,
    );
  }
}
