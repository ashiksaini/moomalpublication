import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';

class PressEventCard extends StatelessWidget {
  const PressEventCard({super.key, this.withGradient = false});
  final bool withGradient;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: scaleWidth(20, context),
          vertical: scaleHeight(10, context)),
      child: ShadowContainer(
        backgroundColor: withGradient ? null : AppColors.pinkLighter,
        borderColor: withGradient ? AppColors.greendark : AppColors.pinkDark,
        linearGradient: withGradient
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.greenLight,
                  AppColors.greenDarker,
                ],
              )
            : null,
        containerChild: Padding(
          padding: EdgeInsets.symmetric(vertical: scaleHeight(16, context)),
          child: CustomText(
              text: "CENTRAL ECONOMIC REVIEW 2022-23 & CENTRAL BUDGET 2023-24",
              textStyle: CustomTextStyle.textStyle20Regular(context,
                  color: AppColors.black)),
        ),
      ),
    );
  }
}
