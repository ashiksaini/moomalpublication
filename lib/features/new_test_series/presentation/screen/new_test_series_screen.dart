import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
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
      body: SafeArea(
        child: Obx(
          () => ScrollConfiguration(
            behavior: NoGlowBehavior(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppbar(
                    title: _quizController.sharedData.testName ?? '',
                    maxLine: 1,
                    prefixIcon: AppAssets.icBackArrow,
                    onPrefixIconClick: () => AppRouting.navigateBack(),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: AppColors.orangeLight,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 4.v, horizontal: 14.h),
                            child: CustomText(
                                textAlign: TextAlign.left,
                                text:
                                    "${'time_left'.tr} : ${_quizController.counter.value}",
                                textStyle: CustomTextStyle.textStyle20Bold(
                                    context,
                                    color: AppColors.black)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.h, vertical: 10.v),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const VerticalGap(size: 16),
                        CustomText(
                            text: "question_type_multiple_choice_questions".tr,
                            textStyle: CustomTextStyle.textStyle24Medium(
                                context,
                                color: AppColors.black)),
                        const VerticalGap(size: 10),
                        CustomText(
                            text:
                                "${'question_no'.tr}: ${_quizController.noOfQuestion.value + 1}",
                            textStyle: CustomTextStyle.textStyle20Bold(context,
                                decoration: TextDecoration.underline,
                                color: AppColors.black)),
                        const VerticalGap(size: 8),
                        CustomText(
                            textAlign: TextAlign.left,
                            text: _quizController
                                .answerList[_quizController.noOfQuestion.value]
                                .question,
                            textStyle: CustomTextStyle.textStyle20StrongBold(
                                context,
                                color: AppColors.black)),
                        const VerticalGap(size: 8),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _quizController.answerList.length,
                            itemBuilder: (context, optionIndex) {
                              return GestureDetector(
                                  onTap: () {
                                    _quizController.onTapAnswer(
                                        optionNumber: optionIndex);
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.h),
                                    child: TestOptionsCard(
                                      optionNumber: optionIndex,
                                      questionNumber:
                                          _quizController.noOfQuestion.value,
                                    ),
                                  ));
                            }),
                        const VerticalGap(size: 100),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomOrangeButton(
                              color: _quizController.previous.value
                                  ? AppColors.orange
                                  : AppColors.greyLight,
                              onTapButton: () {
                                _quizController.onTapPrevious();
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
                            ),
                          ],
                        ),
                        const VerticalGap(size: 20),
                        Row(
                          children: [
                            Expanded(
                              child: CustomOrangeButton(
                                onTapButton: () {
                                  _quizController.onTapSaveNext();
                                },
                                buttonText: 'submit'.tr,
                                radius: 20,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
