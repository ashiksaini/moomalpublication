import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/overall_results_and_online_test_series/presentation/template/result_sheet_marks_card.dart';

class TestDataCard extends StatelessWidget {
  const TestDataCard(
      {super.key,
      required this.title,
      required this.examName,
      required this.testData});
  final String title;
  final List<String> examName;
  final List<String> testData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: scaleWidth(14, context),
          vertical: scaleHeight(30, context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              textAlign: TextAlign.start,
              text: title,
              textStyle: CustomTextStyle.textStyle22Bold(context,
                  decoration: TextDecoration.underline,
                  color: AppColors.black)),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: examName.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: scaleHeight(10, context)),
                  child: ResultSheetMarksCard(
                    testName: examName[index],
                    testList: testData,
                  ),
                );
              }),
          // const BottomMarker(),
        ],
      ),
    );
  }
}
