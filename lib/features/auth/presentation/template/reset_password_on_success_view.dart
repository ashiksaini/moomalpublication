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
        left: 24.h,
        right: 24.h,
        top: 80.v,
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
    return SvgPicture.asset(
      AppAssets.icLogo,
      height: 195.v,
      width: 195.h,
    );
  }

  Widget _getResetPasswordOnSuccessText(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 20.v,
      ),
      decoration: BoxDecoration(
        color: AppColors.green,
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(
          20.r,
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppAssets.icTick, color: AppColors.white,),
          const HorizontalGap(size: 4),
          CustomText(
            text: "reset_password_on_success".tr,
            textStyle: CustomTextStyle.textStyle18BoldCaladea(
              context,
              color: AppColors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _getResetPasswordOnSuccessDesc(BuildContext context) {
    return CustomText(
      text: "reset_password_on_success_desc".tr,
      textStyle:
          CustomTextStyle.textStyle18BoldCaladea(context, color: AppColors.white),
      textAlign: TextAlign.start,
    );
  }
}
