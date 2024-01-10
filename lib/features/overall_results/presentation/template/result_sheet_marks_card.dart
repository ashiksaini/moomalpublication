import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/overall_results/presentation/widgets/sheet_marks_row.dart';
import 'package:moomalpublication/features/test_series/presentation/widgets/button_bar.dart';

class ResultSheetMarksCard extends StatelessWidget {
  const ResultSheetMarksCard({super.key, required this.testName});
  final String testName;

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      borderRadius: scaleRadius(10, context),
      containerChild: Padding(
        padding: EdgeInsets.symmetric(horizontal: scaleWidth(8, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(scaleWidth(8, context)),
              child: CustomButtonBar(
                buttonText: 'start_test'.tr,
                barText: testName,
                textDecoration: TextDecoration.underline,
                // permalink: entry.permalink,
              ),
            ),
            SheetMarksRow(),
          ],
        ),
      ),
    );
  }
}
