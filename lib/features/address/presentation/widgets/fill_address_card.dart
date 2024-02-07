import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class FillAddressCard extends StatelessWidget {
  const FillAddressCard(
      {super.key,
      this.keyboardType = TextInputType.name,
      required this.headingText,
      required this.hintText,
      this.optional = false,
      required this.textEditingController,
      required this.error});
  final bool optional;
  final String headingText;
  final String hintText;
  final bool error;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomText(
              textAlign: TextAlign.start,
              text: headingText,
              textStyle: CustomTextStyle.textStyle15Bold(
                context,
                color: AppColors.black,
              ),
            ),
            CustomText(
              textAlign: TextAlign.start,
              text: (!optional) ? '*' : ' (Optional)',
              textStyle: CustomTextStyle.textStyle15Bold(
                context,
                color: (!optional) ? AppColors.red : AppColors.black,
              ),
            ),
          ],
        ),
        SizedBox(
          height: scaleHeight(2, context),
        ),
        TextField(
          textInputAction: TextInputAction.next,
          keyboardType: keyboardType,
          controller: textEditingController,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: scaleWidth(12, context)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: AppColors.black, width: scaleWidth(1.5, context)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: error ? AppColors.red : AppColors.black),
            ),
            hintText: hintText,
            hintStyle: CustomTextStyle.textStyle15Bold(context,
                color: AppColors.greyLight),
          ),
        ),
      ],
    );
  }
}
