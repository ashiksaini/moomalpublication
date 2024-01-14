import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class SheetMarksRow extends StatelessWidget {
  const SheetMarksRow({super.key, required this.overallDataList});
  final List<String> overallDataList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: scaleHeight(8, context),
          horizontal: scaleWidth(8, context)),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: overallDataList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.6,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        itemBuilder: (_, index) {
          return Container(
            color: Colors.amber,
            child: CustomText(
              // maxLines: 1,
              textAlign: TextAlign.start,
              text: "${overallDataList[index]} : 23",
              textStyle: CustomTextStyle.textStyle18Bold(context),
            ),
          );
        },
      ),
    );
  }
}
