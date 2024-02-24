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
  final Function onClick;

  const MainCategoryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Container(
        height: 160.adaptSize,
        width: 120.adaptSize,
        padding: EdgeInsets.only(
          top: 12.v,
          left: 5.h,
          right: 5.h,
          bottom: 5.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [primaryBoxShadow()],
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              height: 48.v,
              width: 48.h,
            ),
            const VerticalGap(size: 10),
            FittedBox(
              child: CustomText(
                text: title,
                textStyle: CustomTextStyle.textStyle25Bold(
                  context,
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
