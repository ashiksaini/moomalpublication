import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';

class CustomDrawerHeader extends StatelessWidget {
  final String userImage;
  final String userName;
  final String userPhNumber;

  const CustomDrawerHeader({
    super.key,
    required this.userImage,
    required this.userName,
    required this.userPhNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // User Profile Image
        ClipRRect(
          borderRadius: BorderRadius.circular(scaleRadius(28, context)),
          child: Image.asset(
            userImage,
            height: scaleHeight(56, context),
            width: scaleWidth(56, context),
            fit: BoxFit.cover,
          ),
        ),
        const HorizontalGap(size: 10),

        // Username
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: userName, textStyle: CustomTextStyle.textStyle20Bold(context, color: AppColors.white)),
              CustomText(text: userPhNumber, textStyle: CustomTextStyle.textStyle20Bold(context, color: AppColors.white)),
            ],
          ),
        ),

        // Edit Btn
        SvgPicture.asset(
          AppAssets.icEditNavDrawer,
          height: scaleHeight(24, context),
          width: scaleWidth(24, context),
        )
      ],
    );
  }
}
