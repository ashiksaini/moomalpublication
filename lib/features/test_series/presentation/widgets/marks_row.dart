import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/test_series/data/models/test_series_response_model.dart';

class MarksRow extends StatelessWidget {
  const MarksRow({super.key, this.showPrice = false, required this.entry});
  final bool showPrice;
  final TestSeriesResponseModel entry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: scaleHeight(8, context)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: "${"questions".tr}: ${entry.questionCount ?? ''}",
              textStyle: CustomTextStyle.textStyle18Bold(context),
            ),
            CustomText(
              text: "${"max_marks".tr}: ${entry.totalMarks}",
              textStyle: CustomTextStyle.textStyle18Bold(context),
            ),
          ],
        ),
        const VerticalGap(size: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: "${"time".tr}: ${entry.maximumTime} ${"mins".tr}",
              textStyle: CustomTextStyle.textStyle18Bold(context),
            ),
            CustomText(
              text: "${"language".tr}: ${"english".tr}",
              textStyle: CustomTextStyle.textStyle18Bold(context),
            ),
          ],
        ),
        if (showPrice)
          Padding(
            padding: EdgeInsets.only(
              top: scaleHeight(8, context),
            ),
            child: CustomText(
              text: "${"price".tr}: ${entry.price}",
              textStyle: CustomTextStyle.textStyle18Bold(context),
            ),
          )
      ]),
    );
  }
}
