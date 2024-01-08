import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/overall_results/controller/overall_result_controller.dart';
import 'package:moomalpublication/features/overall_results/presentation/template/result_sheet_marks_card.dart';

class TestDataCard extends StatelessWidget {
  TestDataCard({super.key});
  final OverallResultController overallResultController =
      Get.find<OverallResultController>();

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
              text: 'Overall Performance :',
              textStyle: CustomTextStyle.textStyle22Bold(context,
                  decoration: TextDecoration.underline,
                  color: AppColors.black)),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: overallResultController.examName.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: scaleHeight(10, context)),
                  child: ResultSheetMarksCard(
                    testName: overallResultController.examName[index],
                  ),
                );
              }),
          // const BottomMarker(),
        ],
      ),
    );
  }
}
