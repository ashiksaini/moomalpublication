import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/quiz/presentation/widgets/card_image.dart';

class CurrentAffairQuizCard extends StatelessWidget {
  const CurrentAffairQuizCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: scaleHeight(38, context),
          horizontal: scaleWidth(8, context)),
      child: ShadowContainer(
        padding: EdgeInsets.symmetric(
            vertical: scaleHeight(14, context),
            horizontal: scaleWidth(16, context)),
        containerChild: Row(
          children: [
            const CardImage(image: AppAssets.bookPng),
            const HorizontalGap(size: 12),
            Flexible(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: scaleWidth(12, context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      textAlign: TextAlign.left,
                      text: "Current Affair Quiz June 2021",
                      maxLines: 4,
                      textStyle: CustomTextStyle.textStyle20Bold(context,
                          color: AppColors.black),
                    ),
                    const VerticalGap(size: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(AppAssets.icAdmin),
                        const HorizontalGap(size: 8),
                        Flexible(
                          child: CustomText(
                            text: "Admin, 1 June 2021",
                            textStyle: CustomTextStyle.textStyle20Bold(context,
                                color: AppColors.greyLight),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    const VerticalGap(size: 20),
                    CustomText(
                      text:
                          "Name: Current Affairs Quiz Part II Subject: Current Affairs Topics: All Questions: 20 Objective Type",
                      textStyle: CustomTextStyle.textStyle15Regular(context,
                          color: AppColors.black),
                      maxLines: 3,
                      textAlign: TextAlign.start,
                    ),
                    // const VerticalGap(size: 9),
                    // if (quatintyButton) const QuantityButton(),
                    // if (addButton) const AddButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
        borderRadius: 10,
        borderColor: AppColors.orange,
      ),
    );
  }
}
