import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';

class BaseController extends GetxController {
  final TextEditingController emailTextEditingController = TextEditingController();
  final TextEditingController passwordTextEditingController = TextEditingController();
  final RxBool isPasswordVisible = RxBool(false);
  final RxString passwordSuffixIcon = RxString(AppAssets.icVisibleEye);

  bool isCredentialValid() {
    if (emailTextEditingController.text.isEmpty) {
      showSnackBar("email_should_not_be_empty".tr);
      return false;
    }

    if (passwordTextEditingController.text.isEmpty) {
      showSnackBar("password_should_not_be_empty".tr);
      return false;
    }

    return true;
  }

  bool isValidEmail() {
    if (!emailTextEditingController.text.contains(RegExp(AppConstants.emailRegExPattern))) {
      showSnackBar("please_enter_a_valid_email".tr);
      return false;
    }

    return true;
  }

  void changePasswordVisiblity() {
    if (isPasswordVisible.isTrue) {
      passwordSuffixIcon.value = AppAssets.icInvisibleEye;
    } else {
      passwordSuffixIcon.value = AppAssets.icVisibleEye;
    }

    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
