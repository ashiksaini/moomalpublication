import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(AppAssets.icUserPic),
        Positioned.fill(
            child: Center(
          child: SvgPicture.asset(
            AppAssets.icUser,
            width: scaleHeight(60, context),
            height: scaleHeight(60, context),
          ),
        )),
      ],
    );
  }
}
