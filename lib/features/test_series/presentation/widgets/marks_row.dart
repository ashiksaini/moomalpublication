import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';

class MarksRow extends StatelessWidget {
  const MarksRow({super.key, this.showPrice = false});
  final bool showPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: scaleHeight(8, context)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                text: "Questions: 101",
                textStyle: CustomTextStyle.textStyle18Bold(context)),
            CustomText(
                text: "Max. Marks: 101 ",
                textStyle: CustomTextStyle.textStyle18Bold(context)),
          ],
        ),
        const VerticalGap(size: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                text: "Time: 100 Mins",
                textStyle: CustomTextStyle.textStyle18Bold(context)),
            CustomText(
                text: "Language: English",
                textStyle: CustomTextStyle.textStyle18Bold(context)),
          ],
        ),
        if (showPrice)
          Padding(
            padding: EdgeInsets.only(top: scaleHeight(8, context)),
            child: CustomText(
                text: "Price: ₹710",
                textStyle: CustomTextStyle.textStyle18Bold(context)),
          )
      ]),
    );
  }
}
