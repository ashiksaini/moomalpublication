import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/quiz/controller/quiz_controller.dart';

class OptionsCard extends StatelessWidget {
  OptionsCard(
      {super.key, required this.optionNumber, required this.questionNumber});

  final QuizController _quizController = Get.find<QuizController>();
  final int optionNumber;
  final int questionNumber;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: _quizController.testTaken.isFalse
                  ? _quizController.selectedOptions[questionNumber].value == -1
                      ? AppColors.greyLight
                      : _quizController.selectedOptions[questionNumber].value ==
                              optionNumber
                          ? AppColors.orange
                          : AppColors.greyLight
                  : _quizController.answerList[questionNumber][optionNumber]
                              .correctOrNot ==
                          true
                      ? AppColors.green
                      : _quizController.selectedOptions[questionNumber].value ==
                              optionNumber
                          ? AppColors.red
                          : AppColors.greyLight,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(6.h),
              child: CustomText(
                  text: _quizController.optionsName[optionNumber],
                  textStyle: CustomTextStyle.textStyle16MediumTrio(context)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.v),
              child: CustomText(
                  textAlign: TextAlign.start,
                  text: _quizController
                      .answerList[questionNumber][optionNumber].answer
                      .toString(),
                  textStyle: CustomTextStyle.textStyle16MediumTrio(
                    context,
                    color: _quizController.testTaken.isFalse
                        ? AppColors.black
                        : _quizController
                                    .answerList[questionNumber][optionNumber]
                                    .correctOrNot ==
                                true
                            ? AppColors.green
                            : _quizController.selectedOptions[questionNumber]
                                        .value ==
                                    optionNumber
                                ? AppColors.red
                                : AppColors.black,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
