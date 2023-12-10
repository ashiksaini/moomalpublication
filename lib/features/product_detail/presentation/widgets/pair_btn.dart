import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class PairBuyBtn extends StatelessWidget {
  const PairBuyBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _getLeftBtn(context),
        _getRightBtn(context),
      ],
    );
  }

  Widget _getLeftBtn(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(color: AppColors.yellow),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: scaleHeight(7, context),
                horizontal: scaleWidth(5, context),
              ),
              decoration: BoxDecoration(
                color: AppColors.yellow,
                boxShadow: [primaryBoxShadow()],
              ),
              child: SvgPicture.asset(AppAssets.icShopping),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: scaleHeight(10, context),
                bottom: scaleHeight(10, context),
                left: scaleWidth(10, context),
              ),
              child: CustomText(
                text: "add_to_cart".tr,
                textStyle: CustomTextStyle.textStyle25Bold(context, color: AppColors.black),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getLeftBtn2(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(color: AppColors.yellow),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: scaleHeight(7, context),
                horizontal: scaleWidth(5, context),
              ),
              decoration: BoxDecoration(
                color: AppColors.yellow,
                boxShadow: [primaryBoxShadow()],
              ),
              child: SvgPicture.asset(AppAssets.icArrowRight),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: scaleHeight(10, context),
                bottom: scaleHeight(10, context),
                left: scaleWidth(10, context),
              ),
              child: CustomText(
                text: "go_to_cart".tr,
                textStyle: CustomTextStyle.textStyle25Bold(context, color: AppColors.black),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getRightBtn(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(color: AppColors.orangeDark),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: scaleHeight(7, context),
                horizontal: scaleWidth(5, context),
              ),
              decoration: BoxDecoration(
                color: AppColors.orangeDark,
                boxShadow: [primaryBoxShadow()],
              ),
              child: SvgPicture.asset(AppAssets.icShopping),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: scaleHeight(10, context),
                bottom: scaleHeight(10, context),
                left: scaleWidth(10, context),
              ),
              child: CustomText(
                text: "buy_now".tr,
                textStyle: CustomTextStyle.textStyle25Bold(context, color: AppColors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
