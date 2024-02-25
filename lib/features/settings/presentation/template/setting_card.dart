import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';

class SettingCard extends StatelessWidget {
  final String text;
  final Color color;
  final Function? onCardTap;

  const SettingCard({
    super.key,
    required this.text,
    this.color = AppColors.white,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onCardTap != null) {
          onCardTap!();
        }
      },
      child: ShadowContainer(
        backgroundColor: color,
        borderRadius: 10.h,
        containerChild: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: CustomText(
              text: text,
              textStyle: CustomTextStyle.textStyle22Bold(
                context,
                color: AppColors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
