import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/base/product_item/product_item.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/constants/enums.dart';
import 'package:moomalpublication/core/utils/toast.dart';

class BaseController extends GetxController {
  final TextEditingController usernameTextEditingController =
      TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final RxBool isPasswordVisible = RxBool(false);
  final RxString passwordSuffixIcon = RxString(AppAssets.icVisibleEye);

  bool isCredentialValid() {
    if (usernameTextEditingController.text.isEmpty) {
      showToast("username_should_not_be_empty".tr);
      return false;
    }

    if (passwordTextEditingController.text.isEmpty) {
      showToast("password_should_not_be_empty".tr);
      return false;
    }

    return true;
  }

  bool isValidEmail() {
    if (emailTextEditingController.text.isEmpty) {
      showToast("email_should_not_be_empty".tr);
      return false;
    } else if (!emailTextEditingController.text
        .contains(RegExp(AppConstants.emailRegExPattern))) {
      showToast("please_enter_a_valid_email".tr);
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

  Future<void> onProductVariationClick(
    ProductItem item,
    ProductVariation variation,
  ) async {
    item.productVariationType.value = variation;
    item.cartBtnType.value = CartBtnType.addToCart;
    item.quantity = 0;
  }
}
