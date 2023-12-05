import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class ShadowContainer extends StatelessWidget {
  const ShadowContainer(
      {super.key, this.borderRadius = 20, required this.containerChild});

  final double borderRadius;
  final Widget containerChild;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.shadow),
          boxShadow: [primaryBoxShadow()],
          borderRadius: BorderRadius.all(
            Radius.circular(scaleRadius(borderRadius, context)),
          ),
        ),
        child: containerChild);
  }
}
