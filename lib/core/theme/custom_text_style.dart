import 'package:flutter/material.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import '../theme/colors.dart';

class CustomTextStyle {
  CustomTextStyle._();

  /// Montagu Slab Font
  static TextStyle textStyle60BoldMontaguSlab(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: scaleWidth(60, context),
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.montaguSlabFont,
        color: color,
      );

  /// Mina Font
  static TextStyle textStyle40BoldMina(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: scaleWidth(40, context),
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.minaFont,
        color: color,
      );

  /// Calibri Font
  static TextStyle textStyle15Bold(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: scaleWidth(15, context),
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle16Bold(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: scaleWidth(16, context),
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle18Bold(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: scaleWidth(18, context),
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle20Bold(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: scaleWidth(20, context),
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle22Bold(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: scaleWidth(22, context),
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle25Bold(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: scaleWidth(25, context),
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  /// Gupter Font
  static TextStyle textStyle18BoldGupter(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: scaleWidth(16, context),
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.gupterFont,
        color: color,
      );

  static TextStyle textStyle20R(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: scaleWidth(20, context),
        fontWeight: FontWeight.w400,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle20Medium(
    BuildContext context, {
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: scaleWidth(20, context),
        fontWeight: FontWeight.w500,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle16SemiBold(
    BuildContext context, {
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: scaleWidth(16, context),
        fontWeight: FontWeight.w600,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle16Medium(
    BuildContext context, {
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: scaleWidth(16, context),
        fontWeight: FontWeight.w500,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle8Bold(
    BuildContext context, {
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: scaleWidth(8, context),
        fontWeight: FontWeight.w800,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );
  static TextStyle textStyle16Regular(
    BuildContext context, {
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: scaleWidth(16, context),
        fontWeight: FontWeight.w400,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle14Bold(
    BuildContext context, {
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: scaleWidth(14, context),
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle14SemiBold(
    BuildContext context, {
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: scaleWidth(14, context),
        fontWeight: FontWeight.w600,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle14Medium(
    BuildContext context, {
    Color color = AppColors.white,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontSize: scaleWidth(14, context),
        fontWeight: FontWeight.w500,
        fontFamily: AppConstants.calibriFont,
        color: color,
        letterSpacing: letterSpacing,
      );

  static TextStyle textStyle14R(
    BuildContext context, {
    Color color = AppColors.white,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontSize: scaleWidth(14, context),
        fontWeight: FontWeight.w400,
        fontFamily: AppConstants.calibriFont,
        color: color,
        letterSpacing: letterSpacing,
      );

  static TextStyle textStyle13Bold(
    BuildContext context, {
    Color color = AppColors.white,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontSize: scaleWidth(13, context),
        fontWeight: FontWeight.w700,
        letterSpacing: letterSpacing ?? 0.2,
        color: color,
        fontFamily: AppConstants.calibriFont,
      );
  static TextStyle textStyle12Bold(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: scaleWidth(12, context),
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle12SemiBold(
    BuildContext context, {
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: scaleWidth(12, context),
        fontWeight: FontWeight.w600,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle12Medium(
    BuildContext context, {
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: scaleWidth(12, context),
        fontWeight: FontWeight.w500,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle12R(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: scaleWidth(12, context),
        fontWeight: FontWeight.w400,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle10Bold(
    BuildContext context, {
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: scaleWidth(10, context),
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );
  static TextStyle textStyle10Regular(
    BuildContext context, {
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: scaleWidth(10, context),
        fontWeight: FontWeight.w400,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );
  static TextStyle textStyle10SemiBold(
    BuildContext context, {
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: scaleWidth(10, context),
        fontWeight: FontWeight.w600,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle8(
    BuildContext context, {
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: scaleWidth(8, context),
        fontWeight: FontWeight.w600,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle13(
    BuildContext context, {
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: scaleWidth(13, context),
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle11(
    BuildContext context, {
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: scaleWidth(11, context),
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );
  static TextStyle textStyle11Medium(
    BuildContext context, {
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: scaleWidth(11, context),
        fontWeight: FontWeight.w500,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  //PLAYFAIR
  static TextStyle textStyle20BoldPlayfair(
    BuildContext context, {
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: scaleWidth(20, context),
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle20SemiBoldPlayfair(
    BuildContext context, {
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: scaleWidth(20, context),
        fontWeight: FontWeight.w600,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle24BoldPlayfair(
    BuildContext context, {
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: scaleWidth(24, context),
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle36BoldPlayfair(
    BuildContext context, {
    Color color = AppColors.white,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontSize: scaleWidth(36, context),
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.calibriFont,
        letterSpacing: letterSpacing,
        color: color,
      );

  static TextStyle textStyle30BoldPlayfair(
    BuildContext context, {
    Color color = AppColors.white,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontSize: scaleWidth(30, context),
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.calibriFont,
        letterSpacing: letterSpacing,
        color: color,
      );
}
