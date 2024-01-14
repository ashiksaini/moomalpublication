import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/features/overall_results_and_online_test_series/controller/overall_result_controller.dart';
import 'package:moomalpublication/features/overall_results_and_online_test_series/presentation/template/test_data_card.dart';
import 'package:moomalpublication/routes/routing.dart';

class OverallResultScreen extends StatelessWidget {
  OverallResultScreen({super.key});
  final OverallResultController overallResultController =
      Get.put(OverallResultController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbar(
              title: "online_test_series".tr,
              prefixIcon: AppAssets.icBackArrow,
              onPrefixIconClick: () => AppRouting.navigateBack(),
              maxLine: 1,
            ),
            Expanded(
                child: SingleChildScrollView(
                    child: TestDataCard(
              title: 'overall_performace'.tr,
              examName: overallResultController.examName,
              testData: overallResultController.overallPerformance,
            ))),
          ],
        ),
      ),
    );
  }
}
