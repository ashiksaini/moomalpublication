import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class CardImage extends StatelessWidget {
  const CardImage(
      {super.key,
      required this.image,
      required this.borderColor,
      this.height,
      this.width});
  final String image;
  final Color borderColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
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
        width: width,
        height: height,
      ),
    );
  }
}
