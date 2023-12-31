import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class ShadowContainer extends StatelessWidget {
  const ShadowContainer({
    super.key,
    this.borderRadius = 20,
    required this.containerChild,
    this.backgroundColor = AppColors.white,
    this.padding = EdgeInsets.zero,
  });

  final double borderRadius;
  final Widget containerChild;
  final Color backgroundColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: AppColors.shadow),
          boxShadow: [primaryBoxShadow()],
          borderRadius: BorderRadius.all(
            Radius.circular(scaleRadius(borderRadius, context)),
          ),
        ),
        child: containerChild);
  }
}
