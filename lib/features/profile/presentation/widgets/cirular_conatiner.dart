import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: scaleHeight(220, context),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(scaleHeight(220, context)),
          bottomRight: Radius.circular(scaleHeight(220, context)),
        ),
      ),
    );
  }
}
