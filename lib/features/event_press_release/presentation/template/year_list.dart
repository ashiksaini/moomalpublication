import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class YearList extends StatelessWidget {
  const YearList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(scaleRadius(10, context))),
                color: AppColors.orangeLighter.withOpacity(0.9)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: scaleWidth(18, context),
                vertical: scaleWidth(6, context),
              ),
              child: CustomText(
                  text: "2016",
                  textStyle: CustomTextStyle.textStyle20Bold(context,
                      color: AppColors.black)),
            ),
          );
        });
  }
}
