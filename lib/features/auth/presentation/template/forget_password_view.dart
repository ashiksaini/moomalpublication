import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/molecules/auth_btn.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/theme/text_fields.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/auth/controllers/forget_password_controller.dart';

class ForgetPasswordView extends StatelessWidget {
  final ForgetPasswordController _forgetPasswordController =
      Get.put(ForgetPasswordController());

  ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
            const VerticalGap(size: 60),

            // Forget password
            _getForgetPasswordText(context),
            const VerticalGap(size: 45),

            // Email field
            _getEmailTF(context),
            const VerticalGap(size: 30),

            AuthBtn(
              title: "reset_password".tr,
              onClick: () {
                if (!_forgetPasswordController
                    .resetPasswordResponse.value.isLoading) {
                  _forgetPasswordController.onResetPasswordClick();
                }
              },
              isLoadingVisible: _forgetPasswordController
                  .resetPasswordResponse.value.isLoading,
            ),
          ],
        ),
      );
    });
  }

  Widget _getLogo(BuildContext context) {
    return SvgPicture.asset(
      AppAssets.icLogo,
      height: 195.v,
      width: 195.h,
    );
  }

  Widget _getForgetPasswordText(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: "forget_password_txt".tr,
          style: TextStyle(
            color: AppColors.black.withOpacity(0.70),
            fontFamily: AppConstants.calibriFont,
            fontSize: 18.fSize,
            fontWeight: FontWeight.w700,
            height: 1.2,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.black.withOpacity(0.70),
          ),
        ),
        TextSpan(
          text: "forget_password_desc".tr,
          style: TextStyle(
            color: AppColors.white,
            fontFamily: AppConstants.calibriFont,
            fontSize: 18.fSize,
            height: 1.2,
            fontWeight: FontWeight.w700,
          ),
        ),
      ]),
    );
  }

  Widget _getEmailTF(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [primaryBoxShadow()],
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: customTextFormField(
        context,
        _forgetPasswordController.emailTextEditingController,
        hint: "email_address".tr,
        textInputType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        prefixIcon: AppAssets.icEmail,
      ),
    );
  }
}
