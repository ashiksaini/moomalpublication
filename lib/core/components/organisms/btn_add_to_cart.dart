import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';

class BtnAddToCart extends StatelessWidget {
  const BtnAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: scaleWidth(20, context),
        top: scaleHeight(8, context),
        bottom: scaleHeight(8, context),
        right: scaleWidth(12, context),
      ),
      decoration: BoxDecoration(color: AppColors.orangeLight, border: Border.all(color: AppColors.pinkLight), borderRadius: BorderRadius.circular(scaleRadius(5, context))),
      child: Row(
        children: [
          CustomText(
            text: "add_to_cart".tr.toUpperCase(),
            textStyle: CustomTextStyle.textStyle18Bold(context, color: AppColors.black),
          ),
          const HorizontalGap(size: 10),
          SvgPicture.asset(AppAssets.icBookmark)
        ],
      ),
    );
  }
}
