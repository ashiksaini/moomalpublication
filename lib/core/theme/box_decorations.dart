import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';

LinearGradient gradientBg(BuildContext context) {
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.orangeDark,
      AppColors.orangeDark.withOpacity(0.6),
    ],
  );
}

BoxDecoration borderBoxDecoration() {
  return BoxDecoration(
    border: Border.all(color: AppColors.grey),
    boxShadow: [primaryBoxShadow()],
  );
}
