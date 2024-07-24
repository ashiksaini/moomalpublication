import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class ProfilePicture extends StatelessWidget {
  final String? avatarUrl;
  final String? filePath;

  const ProfilePicture({super.key, this.avatarUrl, this.filePath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150.v,
          width: 150.h,
          padding: EdgeInsets.all(2.adaptSize),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.orange),
              shape: BoxShape.circle,
              color: AppColors.white),
          child: CircleAvatar(
            backgroundColor: AppColors.white,
            backgroundImage: (filePath != null && filePath?.isNotEmpty == true)
                ? FileImage(File(filePath!)) as ImageProvider
                : NetworkImage(avatarUrl!),
          ),
        ),
        Positioned(
            bottom: 5,
            right: 0,
            child: Container(
                padding: EdgeInsets.all(5.adaptSize),
                width: 40.h,
                height: 40.v,
                decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.8),
                    shape: BoxShape.circle),
                child: SvgPicture.asset(
                  AppAssets.icEdit1,
                  color: AppColors.orange,
                )))
      ],
    );
  }
}
