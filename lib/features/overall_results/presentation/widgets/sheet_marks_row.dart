import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/overall_results/controller/overall_result_controller.dart';

class SheetMarksRow extends StatelessWidget {
  SheetMarksRow({super.key});
  final OverallResultController overallResultController =
      Get.find<OverallResultController>();
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
        itemCount: overallResultController.overallPerformance.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 6,
          crossAxisSpacing: scaleWidth(10, context),
          mainAxisSpacing: scaleHeight(10, context),
        ),
        itemBuilder: (_, index) {
          return CustomText(
            textAlign: TextAlign.start,
            text: "${overallResultController.overallPerformance[index]} : 23",
            textStyle: CustomTextStyle.textStyle18Bold(context),
          );
        },
      ),
    );
  }
}
