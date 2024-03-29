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
  final Function onClick;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(15.r),
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.grey),
              boxShadow: [primaryBoxShadow()],
            ),
            child: SvgPicture.asset(
              icon,
              height: 48.v,
              width: 48.h,
            ),
          ),
          const VerticalGap(size: 10),
          CustomText(
            text: title,
            textStyle: CustomTextStyle.textStyle20Regular(context),
          ),
        ],
      ),
    );
  }
}
