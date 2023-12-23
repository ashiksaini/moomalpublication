import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

TextFormField customTextFormField(
  BuildContext context,
  TextEditingController? textEditingController, {
  String? hint,
  Function? onTextChange,
  String? prefixIcon,
  String? suffixIcon,
  Function? onSuffixIconClick,
  Function? onPrefixIconClick,
  TextStyle? textStyle,
  TextStyle? hintTextStyle,
  TextInputType textInputType = TextInputType.text,
  TextInputAction textInputAction = TextInputAction.next,
  bool isPasswordField = false,
  bool isPasswordVisible = false,
  double? borderRadius = 20,
}) {
  return TextFormField(
    controller: textEditingController,
    cursorColor: AppColors.orange,
    cursorWidth: scaleWidth(2, context),
    cursorRadius: Radius.circular(scaleRadius(2, context)),
    keyboardType: textInputType,
    textInputAction: textInputAction,
    onChanged: (value) {
      if (onTextChange != null) {
        onTextChange(value);
      }
    },
    style: textStyle ??
        CustomTextStyle.textStyle25Bold(context, color: AppColors.black),
    obscureText: isPasswordField && !isPasswordVisible,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(right: scaleWidth(10, context)),
      fillColor: AppColors.white,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(scaleRadius(borderRadius!, context)),
        borderSide: const BorderSide(color: AppColors.orangeLight),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.grey),
        borderRadius: BorderRadius.circular(scaleRadius(borderRadius, context)),
      ),
      hintText: hint,
      hintStyle: hintTextStyle ??
          CustomTextStyle.textStyle25Bold(context,
              color: AppColors.black.withOpacity(0.29)),
      prefixIcon: prefixIcon != null
          ? GestureDetector(
              onTap: () =>
                  onPrefixIconClick != null ? onPrefixIconClick() : null,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: scaleWidth(16, context),
                    vertical: scaleHeight(12, context)),
                child: SvgPicture.asset(
                  prefixIcon,
                  height: scaleHeight(24, context),
                  width: scaleWidth(24, context),
                ),
              ),
            )
          : null,
      suffixIcon: suffixIcon != null
          ? GestureDetector(
              onTap: () =>
                  onSuffixIconClick != null ? onSuffixIconClick() : null,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: scaleWidth(16, context),
                    vertical: scaleHeight(12, context)),
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
