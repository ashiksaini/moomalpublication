import 'package:flutter/material.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import '../theme/colors.dart';

class CustomTextStyle {
  CustomTextStyle._();

  /// Caladea
  static textStyle18BoldCaladea(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.caladeaFont,
        color: color,
      );

  /// Montagu Slab Font
  static TextStyle textStyle60BoldMontaguSlab(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: 60.fSize,
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
        fontSize: 40.fSize,
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
        fontSize: 10.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static textStyle12Regular(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static textStyle12Medium(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static textStyle15Bold(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static textStyle15Medium(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static textStyle15Regular(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static textStyle16Bold(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static textStyle18Bold(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static textStyle18Medium(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static textStyle20Bold(BuildContext context,
          {Color color = AppColors.grey,
          TextDecoration decoration = TextDecoration.none,
          Color decorationColor = AppColors.black}) =>
      TextStyle(
          fontSize: 20.fSize,
          fontWeight: FontWeight.w700,
          fontFamily: AppConstants.calibriFont,
          color: color,
          decorationColor: decorationColor,
          decoration: decoration,);

  static TextStyle textStyle20SemiBold(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w600,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle20Regular(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );

  static TextStyle textStyle22Bold(BuildContext context,
          {Color color = AppColors.grey,
          TextDecoration decoration = TextDecoration.none,
          Color decorationColor = AppColors.black}) =>
      TextStyle(
          fontSize: 22.fSize,
          fontWeight: FontWeight.w700,
          fontFamily: AppConstants.calibriFont,
          color: color,
          decorationColor: decorationColor,
          decoration: decoration);

  static TextStyle textStyle25Bold(BuildContext context,
          {Color color = AppColors.grey,
          TextDecoration decoration = TextDecoration.none,
          Color decorationColor = AppColors.black}) =>
      TextStyle(
          fontSize: 25.fSize,
          fontWeight: FontWeight.w700,
          fontFamily: AppConstants.calibriFont,
          color: color,
          decorationColor: decorationColor,
          decoration: decoration);

  static textStyle30Bold(BuildContext context,
          {Color color = AppColors.grey,
          TextDecoration decoration = TextDecoration.none,
          Color decorationColor = AppColors.black}) =>
      TextStyle(
          fontSize: 30.fSize,
          fontWeight: FontWeight.w700,
          fontFamily: AppConstants.calibriFont,
          color: color,
          decorationColor: decorationColor,
          decoration: decoration);

  /// Gupter Font
  static TextStyle textStyle18BoldGupter(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.gupterFont,
        color: color,
      );
  static TextStyle textStyle16BoldGupter(
    BuildContext context, {
    Color color = AppColors.grey,
  }) =>
      TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: AppConstants.gupterFont,
        color: color,
      );
  static TextStyle textStyle20SemiMedium(
    BuildContext context, {
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w300,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );
  static TextStyle textStyle16MediumTrio(
    BuildContext context, {
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: AppConstants.calibriFont,
        color: color,
      );
  static TextStyle textStyle18Regular(BuildContext context,
          {Color color = AppColors.black,
          TextDecoration decoration = TextDecoration.none,
          Color decorationColor = AppColors.white}) =>
      TextStyle(
          fontSize: 18.fSize,
          fontWeight: FontWeight.w400,
          fontFamily: AppConstants.calibriFont,
          color: color,
          decorationColor: decorationColor,
          decoration: decoration);
}
