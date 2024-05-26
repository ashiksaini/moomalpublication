import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class ProfilePicture extends StatelessWidget {
  final String avatarUrl;

  const ProfilePicture({super.key, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.h,
      bottom: 0.v,
      right: 0.h,
      top: 0.v,
      child: Container(
        height: 150.v,
        width: 150.h,
        padding: EdgeInsets.all(2.adaptSize),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.orange),
            shape: BoxShape.circle,
            color: AppColors.white),
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: avatarUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
