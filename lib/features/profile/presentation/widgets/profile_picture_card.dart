import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class ProfilePicture extends StatelessWidget {
  final String avatarUrl;

  const ProfilePicture({super.key, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.v,
      width: 150.h,
      padding: EdgeInsets.all(2.adaptSize),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.orange),
          shape: BoxShape.circle,
          color: AppColors.white),
      child: CircleAvatar(
        backgroundColor: AppColors.white,
        backgroundImage: NetworkImage(avatarUrl),
      ),
    );
  }
}
