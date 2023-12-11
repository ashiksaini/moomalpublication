import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class CardImage extends StatelessWidget {
  const CardImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blue),
        borderRadius: BorderRadius.all(
          Radius.circular(scaleRadius(6, context)),
        ),
      ),
      // child: SvgPicture.asset(
      //   image,
      //   width: scaleWidth(150, context),
      //   height: scaleHeight(170, context),
      // ),
      child: Image.asset(
        image,
        width: scaleWidth(150, context),
        height: scaleHeight(170, context),
      ),
    );
  }
}
