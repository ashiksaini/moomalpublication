import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/date_time_utils.dart';
import 'package:moomalpublication/core/utils/no_glow_behaviour.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/address/presentation/widgets/add.dart';
import 'package:moomalpublication/features/new_test_series/controller/new_test_series_controller.dart';
import 'package:moomalpublication/features/new_test_series/presentation/template/test_options_card.dart';
import 'package:moomalpublication/routes/routing.dart';

class NewTestSeriesScreen extends StatelessWidget {
  NewTestSeriesScreen({super.key});
  final NewTestSeriesController _quizController =
      Get.put(NewTestSeriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Container(
          color: AppColors.white,
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbar(
                  title: _quizController.title.value,
                  maxLine: 1,
                  prefixIcon: AppAssets.icBackArrow,
                  onPrefixIconClick: () {
                    AppRouting.navigateBack();
                  },
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.v, horizontal: 14.h),
                  color: AppColors.orangeLight,
                  child: Row(
                    children: [
                      CustomText(
                        textAlign: TextAlign.left,
                        text:
                            "${'time_left'.tr} : ${DateTimeUtils.getFormattedTime(_quizController.counter.value)}",
                        textStyle: CustomTextStyle.textStyle20Bold(
                          context,
                          color: AppColors.black,
                        ),
                      ),
                      const Spacer(),
                      CustomText(
                        textAlign: TextAlign.left,
                        text:
                            "(${_quizController.visibleQuestionIndex.value + 1} / ${_quizController.questions.length}) ",
                        textStyle: CustomTextStyle.textStyle20Bold(
                          context,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: NoGlowBehavior(),
                    child: _quizController.testResponse.value.isLoading
                        ? Center(
                            child: customProgressIndicator(),
                          )
                        : SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.h, vertical: 10.v),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _getQuestionView(context),
                                  const VerticalGap(size: 100),
                                  _getNavigationBtn(),
                                  const VerticalGap(size: 20),
                                  _getSubmitBtn()
                                ],
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getQuestionView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticalGap(size: 16),
        CustomText(
          text: "question_type_multiple_choice_questions".tr,
          textStyle: CustomTextStyle.textStyle24Medium(
            context,
            color: AppColors.black,
          ),
          textAlign: TextAlign.start,
        ),
        const VerticalGap(size: 10),
        CustomText(
            text:
                "${'question_no'.tr}: ${_quizController.visibleQuestionIndex.value + 1}",
            textStyle: CustomTextStyle.textStyle20Bold(context,
                decoration: TextDecoration.underline, color: AppColors.black)),
        const VerticalGap(size: 8),
        Html(
            data: _quizController
                .questions[_quizController.visibleQuestionIndex.value]
                .question),
        const VerticalGap(size: 8),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _quizController
              .questions[_quizController.visibleQuestionIndex.value]
              .answers
              ?.length,
          itemBuilder: (context, optionIndex) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.h),
              child: GestureDetector(
                onTap: () {
                  _quizController.onTapAnswer(
                    optionNumber: optionIndex,
                  );
                },
                child: TestOptionsCard(
                  optionNumber: optionIndex,
                  questionNumber: _quizController.visibleQuestionIndex.value,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _getNavigationBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomOrangeButton(
          color: (_quizController.visibleQuestionIndex.value > 0)
              ? AppColors.orange
              : AppColors.greyLight,
          onTapButton: () {
            if (_quizController.visibleQuestionIndex.value > 0) {
              _quizController.onTapPrevious();
            }
          },
          buttonText: 'previous'.tr,
          radius: 20,
        ),
        CustomOrangeButton(
          onTapButton: () {
            _quizController.onTapSaveNext();
          },
          buttonText: 'save&Next'.tr,
          radius: 20,
          isArrowVisible: true,
        ),
      ],
    );
  }

  Widget _getSubmitBtn() {
    return Row(
      children: [
        Expanded(
          child: _quizController.testSubmitResponse.value.isLoading
              ? Container(
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.r),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.v, horizontal: 24.h),
                    child: Center(
                      child: LottieBuilder.asset(
                        AppAssets.loadingAnimation,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        height: 38.h,
                      ),
                    ),
                  ),
                )
              : CustomOrangeButton(
                  onTapButton: () {
                    _quizController.onTapSubmit();
                  },
                  buttonText: 'submit'.tr,
                  radius: 10,
                ),
        ),
      ],
    );
  }
}
