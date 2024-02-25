import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class ShadowContainer extends StatelessWidget {
  final double? borderRadius;
  final Widget containerChild;
  final Color? backgroundColor;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color? borderColor;
  final LinearGradient? linearGradient;
  final BoxShadow? boxShadow;

  const ShadowContainer({
    super.key,
    required this.containerChild,
    this.borderRadius,
    this.backgroundColor = AppColors.white,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.borderColor = Colors.transparent,
    this.linearGradient,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        gradient: linearGradient,
        color: backgroundColor,
        boxShadow: [boxShadow ?? primaryBoxShadow()],
        border: Border.all(
          color: borderColor!,
        ),
        borderRadius: BorderRadius.all(Radius.circular(
          borderRadius?.r ?? 20.r,
        )),
      ),
      child: containerChild,
    );
  }
}
