import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';

class CategoryItem extends StatelessWidget {
  final String icon;
  final String title;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(scaleRadius(15, context)),
          decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.grey),
            boxShadow: [primaryBoxShadow()],
          ),
          child: SvgPicture.asset(
            icon,
            height: scaleHeight(48, context),
            width: scaleWidth(48, context),
          ),
        ),
        const VerticalGap(size: 10),
        CustomText(
          text: title,
          textStyle: CustomTextStyle.textStyle20Regular(context),
        ),
      ],
    );
  }
}
