import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

TextFormField customTextFormField(
  BuildContext context,
  TextEditingController? textEditingController, {
  TextInputType textInputType = TextInputType.text,
  TextInputAction textInputAction = TextInputAction.next,
  String? hint,
  String? prefixIcon,
  String? suffixIcon,
  Function? onSuffixIconClick,
  bool isPasswordField = false,
  bool isPasswordVisible = false,
}) {
  return TextFormField(
    controller: textEditingController,
    cursorColor: AppColors.orange,
    cursorWidth: scaleWidth(2, context),
    cursorRadius: Radius.circular(scaleRadius(2, context)),
    keyboardType: textInputType,
    textInputAction: textInputAction,
    style: CustomTextStyle.textStyle25Bold(context, color: AppColors.black),
    obscureText: isPasswordField && !isPasswordVisible,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(right: scaleWidth(10, context)),
      fillColor: AppColors.white,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(scaleRadius(20, context)),
        borderSide: const BorderSide(color: AppColors.orangeLight),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.grey),
        borderRadius: BorderRadius.circular(scaleRadius(20, context)),
      ),
      hintText: hint,
      hintStyle: CustomTextStyle.textStyle25Bold(context, color: AppColors.black.withOpacity(0.29)),
      prefixIcon: prefixIcon != null
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: scaleWidth(16, context), vertical: scaleHeight(12, context)),
              child: SvgPicture.asset(
                prefixIcon,
                height: scaleHeight(24, context),
                width: scaleWidth(24, context),
              ),
            )
          : null,
      suffixIcon: suffixIcon != null
          ? GestureDetector(
              onTap: () => onSuffixIconClick!(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: scaleWidth(16, context), vertical: scaleHeight(12, context)),
                child: SvgPicture.asset(
                  suffixIcon,
                  height: scaleHeight(24, context),
                  width: scaleWidth(24, context),
                ),
              ),
            )
          : null,
    ),
  );
}
