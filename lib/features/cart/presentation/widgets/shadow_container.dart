import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class ShadowContainer extends StatelessWidget {
  final double? borderRadius;
  final Widget containerChild;
  final Color backgroundColor;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color borderColor;

  const ShadowContainer({
    super.key,
    required this.containerChild,
    this.borderRadius,
    this.backgroundColor = AppColors.white,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.borderColor = AppColors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [primaryBoxShadow()],
        borderRadius: BorderRadius.all(Radius.circular(scaleRadius(borderRadius ?? scaleRadius(20, context), context))),
      ),
      child: containerChild,
    );
  }
}
