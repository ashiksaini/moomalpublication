import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';

class ContactCard extends StatelessWidget {
  const ContactCard(
      {super.key,
      required this.contactImage,
      required this.contactText,
      required this.contactDescription});

  final String contactImage;
  final String contactText;
  final String contactDescription;

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      containerChild: Padding(
        padding: EdgeInsets.all(12.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  contactImage,
                  height: 25.v,
                  width: 25.v,
                ),
                const HorizontalGap(size: 6),
                CustomText(
                  text: '$contactText:',
                  textStyle: CustomTextStyle.textStyle22Bold(
                    context,
                    color: AppColors.orange,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.orange,
                  ),
                )
              ],
            ),
            const VerticalGap(size: 10),
            SelectableText(
              contactDescription,
              textAlign: TextAlign.start,
              style: CustomTextStyle.textStyle22Bold(context,
                  color: AppColors.black),
            )
          ],
        ),
      ),
    );
  }
}
