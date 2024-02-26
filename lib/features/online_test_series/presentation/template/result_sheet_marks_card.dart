import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/online_test_series/data/models/result.dart';
import 'package:moomalpublication/features/online_test_series/presentation/widgets/sheet_marks_row.dart';
import 'package:moomalpublication/features/test_series/presentation/widgets/button_bar.dart';

class ResultSheetMarksCard extends StatelessWidget {
  final Result testResult;

  const ResultSheetMarksCard({
    super.key,
    required this.testResult,
  });

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      borderRadius: 10.r,
      containerChild: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.h),
              child: CustomButtonBar(
                buttonText: 'reattempt'.tr,
                barText: testResult.testSeries ?? "",
                textDecoration: TextDecoration.underline,
                permalink: testResult.action,
              ),
            ),
            SheetMarksRow(
              testResult: testResult,
            ),
          ],
        ),
      ),
    );
  }
}
