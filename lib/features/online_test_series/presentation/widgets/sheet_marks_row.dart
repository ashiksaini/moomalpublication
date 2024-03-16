import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/online_test_series/data/models/result.dart';

class SheetMarksRow extends StatelessWidget {
  final Result testResult;

  const SheetMarksRow({super.key, required this.testResult});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.v, horizontal: 8.h),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        itemBuilder: (_, index) {
          switch (index) {
            case 0:
              return _getScoreView(
                  context, "score".tr, testResult.score.toString());
            case 1:
              return _getScoreView(
                  context, "rank".tr, testResult.rank.toString());
            case 2:
              return _getScoreView(
                  context, "total".tr, testResult.total.toString());
            case 3:
              return _getScoreView(
                  context, "correct".tr, testResult.correct.toString());
            case 4:
              return _getScoreView(
                  context, "incorrect".tr, testResult.incorrect.toString());
            case 5:
              return _getScoreView(
                  context, "skipped".tr, testResult.skipped.toString());
            default:
              return Container();
          }
        },
      ),
    );
  }

  Widget _getScoreView(BuildContext context, String title, String score) {
    return CustomText(
      textAlign: TextAlign.start,
      text: "$title : $score",
      textStyle: CustomTextStyle.textStyle18Bold(context),
    );
  }
}
