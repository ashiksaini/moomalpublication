import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/features/home/data/models/drawer_item.dart';

class CustomDrawerItem extends StatelessWidget {
  final DrawerItem drawerItem;
  final Function onItemClick;

  const CustomDrawerItem({
    super.key,
    required this.drawerItem,
    required this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onItemClick(drawerItem.drawerItemType),
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            // Icon
            SvgPicture.asset(
              drawerItem.icon,
              height: scaleHeight(20, context),
              width: scaleWidth(20, context),
              colorFilter:
                  const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
            ),
            const HorizontalGap(size: 10),

            // Name
            Padding(
              padding: EdgeInsets.only(top: scaleHeight(4, context)),
              child: CustomText(
                  text: drawerItem.title,
                  textStyle: CustomTextStyle.textStyle18Bold(context)),
            )
          ],
        ),
      ),
    );
  }
}
