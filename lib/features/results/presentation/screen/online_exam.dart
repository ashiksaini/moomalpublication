import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/components/organisms/empty_product.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/features/results/controller/overall_result_controller.dart';
import 'package:moomalpublication/features/results/presentation/template/test_data_card.dart';
import 'package:moomalpublication/routes/routing.dart';

class OnlineExamScreen extends StatelessWidget {
  const OnlineExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Container(
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppbar(
                title: "online_test_series".tr,
                prefixIcon: AppAssets.icBackArrow,
                onPrefixIconClick: () => AppRouting.navigateBack(),
                maxLine: 1,
              ),
              GetX(
                init: OverallResultController(true),
                builder: (overallResultController) {
                  return Expanded(
                    child: overallResultController
                            .overallResultResponse.value.isLoading
                        ? Center(
                            child: customProgressIndicator(),
                          )
                        : overallResultController.overallPerformance.isEmpty
                            ? Center(
                                child: EmptyProductView(
                                    title: "no_test_result_found".tr))
                            : SingleChildScrollView(
                                child: TestDataCard(
                                  title: 'online_exam'.tr,
                                  data: overallResultController
                                      .overallPerformance,
                                ),
                              ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
