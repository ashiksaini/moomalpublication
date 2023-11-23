import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

TextFormField customTextFormField(
  BuildContext context, {
  String? hint,
  String? prefixIcon,
  String? suffixIcon,
  bool? isPasswordField,
  bool? isPasswordVisible,
}) {
  return TextFormField(
    style: CustomTextStyle.textStyle25Bold(context, color: AppColors.black),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(right: scaleWidth(10, context)),
      fillColor: AppColors.white,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      hintText: hint,
      hintStyle: CustomTextStyle.textStyle25Bold(context, color: AppColors.black.withOpacity(0.25)),
      prefixIcon: prefixIcon != null
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: scaleWidth(16, context), vertical: scaleHeight(12, context)),
              child: SvgPicture.asset(prefixIcon),
            )
          : null,
      suffixIcon: suffixIcon != null
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: scaleWidth(16, context), vertical: scaleHeight(12, context)),
              child: SvgPicture.asset(suffixIcon),
            )
          : null,
    ),
  );
}
