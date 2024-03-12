import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/online_test_series/data/models/result.dart';
import 'package:moomalpublication/features/online_test_series/presentation/template/result_sheet_marks_card.dart';

class TestDataCard extends StatelessWidget {
  final String title;
  final List<Result> data;

  const TestDataCard({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 14.h,
        vertical: 15.v,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            textAlign: TextAlign.start,
            text: title,
            textStyle: CustomTextStyle.textStyle22Bold(
              context,
              decoration: TextDecoration.underline,
              color: AppColors.black,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 10.v),
                child: ResultSheetMarksCard(testResult: data[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}
