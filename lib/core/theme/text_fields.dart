import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

TextFormField customTextFormField(
  BuildContext context,
  TextEditingController? textEditingController, {
  String? hint,
  String? label,
  Function? onTextChange,
  String? prefixIcon,
  String? suffixIcon,
  Function? onSuffixIconClick,
  Function? onPrefixIconClick,
  TextStyle? textStyle,
  TextStyle? hintTextStyle,
  TextStyle? labelTextStyle,
  TextInputType textInputType = TextInputType.text,
  TextInputAction textInputAction = TextInputAction.next,
  bool isPasswordField = false,
  bool isPasswordVisible = false,
  bool isReadOnly = false,
  double? borderRadius = 20,
}) {
  return TextFormField(
    controller: textEditingController,
    cursorColor: AppColors.orange,
    cursorWidth: 2.h,
    cursorRadius: Radius.circular(2.r),
    keyboardType: textInputType,
    textInputAction: textInputAction,
    readOnly: isReadOnly,
    onChanged: (value) {
      if (onTextChange != null) {
        onTextChange(value);
      }
    },
    style: textStyle ??
        CustomTextStyle.textStyle25Bold(context, color: AppColors.black),
    obscureText: isPasswordField && !isPasswordVisible,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(right: 10.h),
      fillColor: AppColors.white,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(borderRadius!.r),
        borderSide: const BorderSide(color: AppColors.orangeLight),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.grey),
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
      labelText: label,
      labelStyle: labelTextStyle ??
          CustomTextStyle.textStyle25Bold(context,
              color: AppColors.black.withOpacity(0.29)),
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
                    horizontal: 16.h,
                    vertical: 12.v),
                child: SvgPicture.asset(
                  prefixIcon,
                  height: 24.v,
                  width: 24.h,
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
                    horizontal: 16.h,
                    vertical: 12.v),
                child: SvgPicture.asset(
                  suffixIcon,
                  height: 24.v,
                  width: 24.h,
                ),
              ),
            )
          : null,
    ),
  );
}
