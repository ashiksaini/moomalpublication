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
  static textStyle10Bold(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: scaleWidth(10, context),
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static textStyle12Regular(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: scaleWidth(12, context),
        fontWeight: FontWeight.w400,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static textStyle12Medium(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: scaleWidth(12, context),
        fontWeight: FontWeight.w500,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );
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

  static textStyle15Medium(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: scaleWidth(15, context),
        fontWeight: FontWeight.w500,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static textStyle15Regular(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: scaleWidth(15, context),
        fontWeight: FontWeight.w400,
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

  static TextStyle textStyle18Medium(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: scaleWidth(18, context),
        fontWeight: FontWeight.w500,
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

  static TextStyle textStyle20SemiBold(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: scaleWidth(20, context),
        fontWeight: FontWeight.w600,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle20Regular(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: scaleWidth(20, context),
        fontWeight: FontWeight.w400,
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

  static textStyle30Bold(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: scaleWidth(30, context),
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
  static TextStyle textStyle16BoldGupter(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: scaleWidth(16, context),
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.gupterFont,
        color: color,
      );
  static TextStyle textStyle20SemiMedium(
    BuildContext context, {
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: scaleWidth(16, context),
        fontWeight: FontWeight.w300,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );
}
