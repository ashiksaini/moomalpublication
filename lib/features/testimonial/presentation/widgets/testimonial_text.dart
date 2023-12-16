import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class TestomonialTemplates extends StatelessWidget {
  const TestomonialTemplates({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: scaleHeight(30, context)),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: "our".tr, style: _getTextStyle(context, AppColors.black)),
            TextSpan(
                text: "client".tr,
                style: _getTextStyle(context, AppColors.orange)),
            TextSpan(
                text: "or".tr, style: _getTextStyle(context, AppColors.black)),
            TextSpan(
                text: "student".tr,
                style: _getTextStyle(context, AppColors.orange)),
            TextSpan(
                text: "testimonial".tr.toUpperCase(),
                style: _getTextStyle(context, AppColors.black)),
          ],
        ),
      ),
    );
  }

  TextStyle _getTextStyle(BuildContext context, Color color) {
    return TextStyle(
      color: color,
      fontSize: scaleWidth(25, context),
      fontWeight: FontWeight.w700,
      fontFamily: AppConstants.calibriFont,
      shadows: [
        Shadow(
          offset: const Offset(0, 4.0),
          blurRadius: 8,
          color: Colors.black.withOpacity(0.25),
        )
      ],
    );
  }
}
