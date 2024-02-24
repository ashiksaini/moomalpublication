import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class ProfilePicture extends StatelessWidget {
  final String avatarUrl;

  const ProfilePicture({super.key, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(AppAssets.icUserPic),
        Positioned.fill(
            child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: CachedNetworkImage(
              imageUrl: avatarUrl,
              fit: BoxFit.cover,
            ),
          ),
        )),
      ],
    );
  }
}
