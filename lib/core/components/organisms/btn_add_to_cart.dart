import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/constants/enums.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class BtnAddToCart extends StatelessWidget {
  final CartBtnType cartBtnType;
  final Function onClick;

  const BtnAddToCart({
    super.key,
    required this.onClick,
    required this.cartBtnType,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: scaleHeight(5, context),
        ),
        decoration: BoxDecoration(
          color: AppColors.orangeLight,
          border: Border.all(color: AppColors.pinkLight),
          borderRadius: BorderRadius.circular(
            scaleRadius(5, context),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomText(
              text: (cartBtnType == CartBtnType.addToCart)
                  ? "add_to_cart".tr.toUpperCase()
                  : "go_to_cart".tr.toUpperCase(),
              textStyle: CustomTextStyle.textStyle18Bold(context,
                  color: AppColors.black),
            ),
            // const Spacer(),
            SvgPicture.asset(
              (cartBtnType == CartBtnType.addToCart)
                  ? AppAssets.icBookmark
                  : AppAssets.icBookmarkFilled,
            ),
          ],
        ),
      ),
    );
  }
}
