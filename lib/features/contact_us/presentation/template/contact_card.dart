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
      {super.key, required this.contactImage, required this.contactText});

  final String contactImage;
  final String contactText;

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
        containerChild: Padding(
      padding: EdgeInsets.all(scaleWidth(12, context)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                contactImage,
                height: scaleHeight(25, context),
                width: scaleHeight(25, context),
              ),
              const HorizontalGap(size: 6),
              CustomText(
                  text: contactText,
                  textStyle: CustomTextStyle.textStyle22Bold(context,
                      color: AppColors.orange,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.orange))
            ],
          ),
          const VerticalGap(size: 10),
          CustomText(
              textAlign: TextAlign.start,
              text:
                  "50, Agrasen Nagar, Near Mahesh Nagar Phatak, Jaipur, (Rajasthan) 302015",
              textStyle: CustomTextStyle.textStyle22Bold(context,
                  color: AppColors.black))
        ],
      ),
    ),);
  }
}
