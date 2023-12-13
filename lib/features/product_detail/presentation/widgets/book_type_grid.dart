import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class BookTypeGrid extends StatelessWidget {
  const BookTypeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: scaleWidth(15, context),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (_, index) {
          if (index == 1) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.cyan,
                boxShadow: [primaryBoxShadow()],
              ),
              child: _getBookDetailItem(
                  context, "Categorie", "Current GK, New books",
                  textColor: AppColors.black),
            );
          }
          return _getBookDetailItem(
              context, "Categorie", "Current GK, New books");
        },
      ),
    );
  }

  Widget _getBookDetailItem(BuildContext context, String title, String subtitle,
      {Color textColor = AppColors.grey}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
      ),
      padding: EdgeInsets.symmetric(
        vertical: scaleHeight(15, context),
        horizontal: scaleWidth(15, context),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Title
          CustomText(
            text: title,
            textStyle:
                CustomTextStyle.textStyle20Bold(context, color: textColor),
          ),

          // SubTitle
          CustomText(
            maxLines: 2,
            text: subtitle,
            textStyle:
                CustomTextStyle.textStyle20Bold(context, color: textColor),
          ),
        ],
      ),
    );
  }
}
