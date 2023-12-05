import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: scaleWidth(12, context),
          vertical: scaleWidth(8, context)),
      child: Column(
        children: [
          CustomText(
            text: "Order Details",
            textStyle: CustomTextStyle.textStyle20Bold(
              context,
            ),
          ),
          Divider(
              height: scaleWidth(2, context),
              thickness: scaleWidth(1, context)),
          const VerticalGap(size: 20),
          itemCash(
              context: context, item: "Products Total (1 item)", cash: "25")
        ],
      ),
    );
  }
}

Widget itemCash(
    {required BuildContext context,
    required String item,
    required String cash,
    bool free = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomText(
        text: item,
        textStyle: CustomTextStyle.textStyle20Bold(
          context,
        ),
      ),
      CustomText(
        text: cash,
        textStyle: CustomTextStyle.textStyle20Bold(
          context,
        ),
      ),
    ],
  );
}
