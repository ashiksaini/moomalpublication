import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';

class CustomDrawerHeader extends StatelessWidget {
  final String userImage;
  final String? filePath;
  final String userName;

  const CustomDrawerHeader({
    super.key,
    required this.userImage,
    required this.userName,
    this.filePath
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // User Profile Image
        Container(
          height: 56.adaptSize,
          width: 56.adaptSize,
          padding: EdgeInsets.all(2.adaptSize),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.orange),
              shape: BoxShape.circle,
              color: AppColors.white),
          child: CircleAvatar(
            radius: 28.r,
            backgroundImage: (filePath != null && filePath?.isNotEmpty == true)
                ? FileImage(File(filePath!)) as ImageProvider
                : NetworkImage(
                    userImage,
                  ),
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
        // GestureDetector(
        //   onTap: () => AppRouting.offAllNamed(NameRoutes.moomalpublicationApp,
        //       argument: 4),
        //   child: SvgPicture.asset(
        //     AppAssets.icEditNavDrawer,
        //     height: 24.v,
        //     width: 24.h,
        //   ),
        // )
      ],
    );
  }
}
