import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class CustomToast {
  CustomToast._();

  static final FToast _fToast = FToast();

  static showToast(
    String title, {
    String? icon,
    bool showIcon = false,
    Color? bgColor,
    Color? textColor,
  }) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: bgColor ?? AppColors.black,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showIcon) ...{
            SvgPicture.asset(icon!),
            SizedBox(width: 10.h),
          },
          CustomText(
            text: title,
            textStyle: CustomTextStyle.textStyle18BoldCaladea(
              Get.context!,
              color: textColor ?? AppColors.white,
            ),
          )
        ],
      ),
    );

    _fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
