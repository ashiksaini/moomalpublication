import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';

class ListGridRow extends StatelessWidget {
  const ListGridRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: scaleHeight(16, context),
          bottom: scaleHeight(16, context),
          right: scaleWidth(10, context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset(
            AppAssets.icGrid,
            height: scaleHeight(20, context),
            width: scaleWidth(20, context),
          ),
          const HorizontalGap(size: 16),
          SvgPicture.asset(
            AppAssets.icList,
            height: scaleHeight(20, context),
            width: scaleWidth(20, context),
          ),
        ],
      ),
    );
  }
}
