import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';

class BookTypeGrid extends StatelessWidget {
  const BookTypeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: scaleWidth(30, context),
          horizontal: scaleWidth(15, context)),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: scaleWidth(150, context),
          ),
          itemBuilder: (_, index) {
            return Container(
              decoration:
                  BoxDecoration(border: Border.all(color: AppColors.greyLight)),
              padding: EdgeInsets.only(
                left: scaleWidth(38, context),
                right: scaleWidth(38, context),
                top: scaleWidth(17, context),
                bottom: scaleWidth(17, context),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Book",
                    textStyle: CustomTextStyle.textStyle20BoldPlayfair(context,
                        color: AppColors.greyLight),
                  ),
                  const VerticalGap(size: 12),
                  CustomText(
                    maxLines: 1,
                    text: "Current GK, New books",
                    textStyle: CustomTextStyle.textStyle20BoldPlayfair(context,
                        color: AppColors.greyLight),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
