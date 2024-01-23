import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class TextCard extends StatelessWidget {
  const TextCard({super.key, required this.name, required this.subject});
  final String name;
  final String subject;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: scaleHeight(8, context)),
      child: RichText(
        text: TextSpan(
          text: "$name : ",
          style:
              CustomTextStyle.textStyle18Bold(context, color: AppColors.black),
          children: <TextSpan>[
            TextSpan(
              text: subject,
              style: CustomTextStyle.textStyle18Bold(context,
                  color: AppColors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

