import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class CardImage extends StatelessWidget {
  const CardImage(
      {super.key,
      required this.image,
      required this.borderColor,
      this.height,
      this.width,
      this.assetsImage = true});
  final String image;
  final Color borderColor;
  final double? height;
  final double? width;
  final bool assetsImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.all(
          Radius.circular(scaleRadius(6, context)),
        ),
      ),
      child: assetsImage
          ? Image.asset(
              image,
              width: width ?? scaleWidth(150, context),
              height: height ?? scaleHeight(170, context),
            )
          : Image.network(
              image,
              width: width ?? scaleWidth(150, context),
              height: height ?? scaleHeight(170, context),
            ),
    );
  }
}
