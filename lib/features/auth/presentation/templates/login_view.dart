import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/molecules/auth_btn.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/theme/text_fields.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/auth/controllers/login_controller.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

class LoginView extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: EdgeInsets.only(
          left: scaleWidth(24, context),
          right: scaleWidth(24, context),
          top: scaleHeight(100, context),
        ),
        child: Column(
          children: [
            // Logo
            _getLogo(context),
            const VerticalGap(size: 69),

            // Username field
            _getUsernameTF(context),
            const VerticalGap(size: 30),

            // Password field
            _getPasswordTF(context),
            const VerticalGap(size: 10),

            // Remember me and Forget password
            _getRememberMeOrForgetPasswordView(context),
            const VerticalGap(size: 39),

            // Login Btn
            _getLoginBtn(context),
            const VerticalGap(size: 20),

            // Register Btn
            AuthBtn(
              title: "register".tr,
              onClick: () => AppRouting.toNamed(NameRoutes.signupScreen),
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
        _loginController.usernameTextEditingController,
        hint: "username".tr,
        prefixIcon: AppAssets.icUser,
      ),
    );
  }

  Widget _getPasswordTF(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [primaryBoxShadow()],
        borderRadius: BorderRadius.circular(scaleRadius(20, context)),
      ),
      child: customTextFormField(
        context,
        _loginController.passwordTextEditingController,
        textInputAction: TextInputAction.done,
        hint: "password".tr,
        prefixIcon: AppAssets.icPassword,
        suffixIcon: _loginController.passwordSuffixIcon.value,
        onSuffixIconClick: _loginController.changePasswordVisiblity,
        isPasswordField: true,
        isPasswordVisible: _loginController.isPasswordVisible.value,
      ),
    );
  }

  Widget _getRememberMeOrForgetPasswordView(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Remember me
        Row(
          children: [
            SizedBox(
              height: scaleHeight(24, context),
              width: scaleWidth(24, context),
              child: Checkbox(
                side: const BorderSide(color: AppColors.white),
                checkColor: AppColors.orange,
                activeColor: AppColors.white,
                value: _loginController.rememberMe.value,
                onChanged: (value) {
                  _loginController.rememberMe.value = !_loginController.rememberMe.value;
                },
              ),
            ),
            const HorizontalGap(size: 4),
            CustomText(
              text: "remember_me".tr,
              textStyle: CustomTextStyle.textStyle18Bold(context, color: AppColors.white),
            ),
          ],
        ),

        // Forget Password
        GestureDetector(
          onTap: () => AppRouting.toNamed(NameRoutes.forgetPasswordScreen),
          child: CustomText(
            text: "forget_password".tr,
            textStyle: CustomTextStyle.textStyle18Bold(context, color: AppColors.white),
          ),
        ),
      ],
    );
  }

  Widget _getLoginBtn(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [primaryBoxShadow()],
      ),
      child: AuthBtn(
        title: "login".tr,
        onClick: () {
          if (!_loginController.loginResponse.value.isLoading) _loginController.onLogin();
        },
        isLoadingVisible: _loginController.loginResponse.value.isLoading,
      ),
    );
  }
}
