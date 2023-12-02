import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/molecules/auth_btn.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/theme/text_fields.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/auth/controllers/register_controller.dart';

class RegisterView extends StatelessWidget {
  final RegisterController _registerController = Get.put(RegisterController());

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
            const VerticalGap(size: 69),

            // Username field
            _getUsernameTF(context),
            const VerticalGap(size: 30),

            // Email field
            _getEmailTF(context),
            const VerticalGap(size: 30),

            // Password field
            _getPasswordTf(context),
            const VerticalGap(size: 14),

            // Privacy Policy
            _getPrivacyPolicyText(context),
            const VerticalGap(size: 20),

            AuthBtn(
              title: "register".tr,
              onClick: () {
                if (!_registerController.userRegisterResponse.value.isLoading)
                  _registerController.onRegister();
              },
              isLoadingVisible:
                  _registerController.userRegisterResponse.value.isLoading,
            ),
          ],
        ),
      );
    });
  }

  Widget _getLogo(BuildContext context) {
    return Image.asset(
      AppAssets.icLogo1,
      height: scaleHeight(195, context),
      width: scaleWidth(195, context),
    );
  }

  Widget _getUsernameTF(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [primaryBoxShadow()],
        borderRadius: BorderRadius.circular(scaleRadius(20, context)),
      ),
      child: customTextFormField(
        context,
        _registerController.usernameTextEditingController,
        hint: "username".tr,
        prefixIcon: AppAssets.icUser,
      ),
    );
  }

  Widget _getEmailTF(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [primaryBoxShadow()],
        borderRadius: BorderRadius.circular(scaleRadius(20, context)),
      ),
      child: customTextFormField(
        context,
        _registerController.emailTextEditingController,
        hint: "email_address".tr,
        textInputType: TextInputType.emailAddress,
        prefixIcon: AppAssets.icEmail,
      ),
    );
  }

  Widget _getPasswordTf(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [primaryBoxShadow()],
        borderRadius: BorderRadius.circular(scaleRadius(20, context)),
      ),
      child: customTextFormField(
        context,
        _registerController.passwordTextEditingController,
        textInputAction: TextInputAction.done,
        hint: "password".tr,
        prefixIcon: AppAssets.icPassword,
        suffixIcon: _registerController.passwordSuffixIcon.value,
        onSuffixIconClick: _registerController.changePasswordVisiblity,
        isPasswordField: true,
        isPasswordVisible: _registerController.isPasswordVisible.value,
      ),
    );
  }

  Widget _getPrivacyPolicyText(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: "privacy_policy_desc".tr,
          style: TextStyle(
            color: AppColors.black.withOpacity(0.70),
            fontFamily: AppConstants.calibriFont,
            fontSize: scaleWidth(18, context),
            height: 1.2,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextSpan(
          text: "privacy_policy".tr,
          recognizer: TapGestureRecognizer()
            ..onTap = () => _registerController.onPrivacyPolicyClick(),
          style: TextStyle(
            color: AppColors.black.withOpacity(0.70),
            fontFamily: AppConstants.calibriFont,
            fontSize: scaleWidth(18, context),
            fontWeight: FontWeight.w700,
            height: 1.2,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.black.withOpacity(0.70),
          ),
        ),
      ]),
    );
  }
}
