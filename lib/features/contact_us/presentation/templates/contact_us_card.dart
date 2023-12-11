import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';

class ContactUsCard extends StatelessWidget {
  final String image;
  final String imageText;
  final String text;
  const ContactUsCard(
      {super.key,
      required this.image,
      required this.text,
      required this.imageText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShadowContainer(
          backgroundColor: AppColors.orangeBackground,
          containerChild: Padding(
            padding: EdgeInsets.only(
                top: scaleHeight(12, context),
                bottom: scaleHeight(22, context),
                left: scaleWidth(12, context),
                right: scaleWidth(12, context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      image,
                      width: scaleWidth(24, context),
                    ),
                    HorizontalGap(size: scaleWidth(14, context)),
                    CustomText(
                      text: '$imageText:',
                      textStyle: CustomTextStyle.textStyle22BoldUnderline(
                        context,
                      ),
                    ),
                  ],
                ),
                const VerticalGap(size: 12),
                CustomText(
                  text: text,
                  textAlign: TextAlign.start,
                  textStyle: CustomTextStyle.textStyle22Bold(context,
                      color: AppColors.black),
                ),
              ],
            ),
          ),
          borderRadius: scaleWidth(12, context),
        ),
        const VerticalGap(size: 30),
      ],
    );
  }
}
