import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/atoms/custom_text.dart';
import '../theme/colors.dart';
import '../theme/custom_text_style.dart';

void showSnackBar(String message, {String err = ""}) {
  WidgetsFlutterBinding.ensureInitialized();

  Get.showSnackbar(
    GetSnackBar(
      messageText: CustomText(
        text: message,
        textAlign: TextAlign.start,
        textStyle: CustomTextStyle.textStyle12Medium(Get.context!, color: AppColors.white),
      ),
      backgroundColor: AppColors.orange,
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.down,
    ),
  );
}
