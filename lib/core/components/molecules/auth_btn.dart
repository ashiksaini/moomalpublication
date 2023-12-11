import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class AuthBtn extends StatelessWidget {
  final String title;
  final Function onClick;
  final bool isLoadingVisible;

  const AuthBtn({
    super.key,
    required this.title,
    required this.onClick,
    this.isLoadingVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Container(
        color: AppColors.black.withOpacity(0.67),
        child: Center(
          child: isLoadingVisible
              ? LottieBuilder.asset(
                  AppAssets.loadingAnimation,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  height: scaleHeight(43, context),
                )
              : Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: scaleHeight(8, context)),
                  child: CustomText(
                    text: title,
                    textStyle: CustomTextStyle.textStyle25Bold(
                      context,
                      color: AppColors.white,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
