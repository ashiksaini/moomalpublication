import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/no_glow_behaviour.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/new_test_series/controller/new_test_series_controller.dart';
import 'package:moomalpublication/features/new_test_series/data/constants/enums.dart';
import 'package:moomalpublication/features/new_test_series/presentation/widgets/result_view.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TestResultScreen extends StatefulWidget {
  const TestResultScreen({super.key});

  @override
  State<TestResultScreen> createState() => _TestResultScreenState();
}

class _TestResultScreenState extends State<TestResultScreen> {
  final NewTestSeriesController _quizController =
      Get.put(NewTestSeriesController());

  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);
    _quizController.getResult();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppbar(
                title: _quizController.testSeriesResponseModel?.postTitle ?? '',
                maxLine: 1,
                prefixIcon: AppAssets.icBackArrow,
                onPrefixIconClick: () {
                  AppRouting.navigateBack();
                },
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: NoGlowBehavior(),
                  child: _quizController.testResultResponse.value.isLoading
                      ? Center(
                          child: customProgressIndicator(),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.h, vertical: 10.v),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: AppColors.orange_100,
                                    border:
                                        Border.all(color: AppColors.greyLight),
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: SfCircularChart(
                                    legend: const Legend(
                                        isVisible: true,
                                        alignment: ChartAlignment.center,
                                        position: LegendPosition.right),
                                    tooltipBehavior: _tooltipBehavior,
                                    title: ChartTitle(
                                        text: 'test_summary'.tr,
                                        textStyle: CustomTextStyle
                                            .textStyle20BoldCaladea(context,
                                                color: AppColors.black,
                                                decoration:
                                                    TextDecoration.underline),
                                        alignment: ChartAlignment.near),
                                    series: <CircularSeries>[
                                      DoughnutSeries<ChartData, String>(
                                        dataSource: _quizController.chartData,
                                        pointColorMapper: (ChartData data, _) =>
                                            data.color,
                                        xValueMapper: (ChartData data, _) =>
                                            data.x,
                                        yValueMapper: (ChartData data, _) =>
                                            data.y,
                                      )
                                    ]),
                              ),
                              const VerticalGap(size: 20),
                              CustomText(
                                  text: 'result'.tr,
                                  textStyle:
                                      CustomTextStyle.textStyle20BoldCaladea(
                                          context,
                                          color: AppColors.black,
                                          decoration:
                                              TextDecoration.underline)),
                              const VerticalGap(size: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ResultView(
                                      resultType: ResultType.score,
                                      value: _quizController.formatString(
                                          _quizController.testResultResponseData
                                                  .value.score ??
                                              "/")),
                                  ResultView(
                                      resultType: ResultType.rank,
                                      value: _quizController.formatString(
                                          _quizController.testResultResponseData
                                                  .value.rank ??
                                              "/"))
                                ],
                              )
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
