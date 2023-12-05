import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';

class MainCategoryCard extends StatelessWidget {
  final String icon;
  final String title;

  const MainCategoryCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: scaleHeight(140, context),
      width: scaleWidth(100, context),
      padding: EdgeInsets.only(
        top: scaleHeight(12, context),
        left: scaleWidth(5, context),
        right: scaleWidth(5, context),
        bottom: scaleWidth(5, context),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(scaleRadius(10, context)),
        boxShadow: [primaryBoxShadow()],
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            height: scaleHeight(48, context),
            width: scaleWidth(48, context),
          ),
          const VerticalGap(size: 15),
          CustomText(
            text: title,
            textStyle: CustomTextStyle.textStyle25Bold(context,
                color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
