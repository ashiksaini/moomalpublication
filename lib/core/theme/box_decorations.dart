import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/colors.dart';

LinearGradient gradientBg() {
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.orangeDark,
      AppColors.orange.withOpacity(0.8),
      AppColors.greyDark,
    ],
  );
}
