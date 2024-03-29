import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

class CustomDrawerHeader extends StatelessWidget {
  final String userImage;
  final String userName;

  const CustomDrawerHeader({
    super.key,
    required this.userImage,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // User Profile Image
        ClipRRect(
          borderRadius: BorderRadius.circular(28.r),
          child: CachedNetworkImage(
            imageUrl: userImage,
            height: 56.adaptSize,
            width: 56.adaptSize,
            fit: BoxFit.contain,
          ),
        ),
        const HorizontalGap(size: 10),

        // Username
        Expanded(
          child: CustomText(
            text: userName,
            textStyle: CustomTextStyle.textStyle20Bold(context,
                color: AppColors.white),
            textAlign: TextAlign.start,
          ),
        ),

        // Edit Btn
        GestureDetector(
          onTap: () => AppRouting.offAllNamed(NameRoutes.moomalpublicationApp,
              argument: 4),
          child: SvgPicture.asset(
            AppAssets.icEditNavDrawer,
            height: 24.v,
            width: 24.h,
          ),
        )
      ],
    );
  }
}
