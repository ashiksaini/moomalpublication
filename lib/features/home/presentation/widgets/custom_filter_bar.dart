import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/organisms/custom_drop_down_1.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class CustomFilterBar extends StatelessWidget {
  const CustomFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        CustomDropDown1(items: ["All india exam", "items 2"]),
        CustomDropDown1(items: ["items 2", "items 1"]),
        SvgPicture.asset(AppAssets.icFilter)
      ],),
    );
  }
}