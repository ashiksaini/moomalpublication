import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
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
        SvgPicture.asset(icon),
        const VerticalGap(size: 12),
        CustomText(
          text: title,
          textStyle: CustomTextStyle.textStyle25Bold(context, color: AppColors.black),
        ),
      ],
    );
  }
}
