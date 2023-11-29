import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';

class CustomDrawerItem extends StatelessWidget {
  final String icon;
  final String title;
  final Function onTap;

  const CustomDrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Row(
        children: [
          // Icon
          SvgPicture.asset(
            icon,
            height: scaleHeight(20, context),
            width: scaleWidth(20, context),
          ),
          const HorizontalGap(size: 10),

          // Name
          Padding(
            padding: EdgeInsets.only(top: scaleHeight(4, context)),
            child: CustomText(text: title, textStyle: CustomTextStyle.textStyle18Bold(context)),
          )
        ],
      ),
    );
  }
}
