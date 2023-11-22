import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/colors.dart';

BoxShadow primaryBoxShadow() {
  return const BoxShadow(
    color: AppColors.shadow,
    offset: Offset(2, 5),
    blurRadius: 4,
    spreadRadius: 2,
  );
}
