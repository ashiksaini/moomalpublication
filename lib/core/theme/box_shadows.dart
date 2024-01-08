import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/colors.dart';

BoxShadow primaryBoxShadow() {
  return  BoxShadow(
    color: AppColors.shadow,
    offset: Offset(0, 4),
    blurRadius: 4,
    spreadRadius: 1,
  );
}

BoxShadow secondaryBoxShadow() {
  return const BoxShadow(
    color: AppColors.redBright,
    blurRadius: 4,
    offset: Offset(0, 0),
  );
}
