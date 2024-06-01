import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/new_test_series/controller/new_test_series_controller.dart';

class TestOptionsCard extends StatelessWidget {
  TestOptionsCard(
      {super.key, required this.optionNumber, required this.questionNumber});

  final NewTestSeriesController _quizController =
      Get.find<NewTestSeriesController>();
  final int optionNumber;
  final int questionNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: _quizController.answerList[questionNumber].selectedOption ==
                    optionNumber
                ? AppColors.orange
                : AppColors.greyLight,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(10.h),
            child: CustomText(
                text: ' ',
                textStyle: CustomTextStyle.textStyle16MediumTrio(context)),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 10.v),
            child: CustomText(
                textAlign: TextAlign.start,
                text: _quizController
                    .answerList[questionNumber].options[optionNumber]
                    .toString(),
                textStyle: CustomTextStyle.textStyle18Bold(context,
                    color: AppColors.black
                    // _quizController.testTaken.isFalse
                    //     ? AppColors.black
                    //     : _quizController
                    //                 .answerList[questionNumber][optionNumber]
                    //                 .correctOrNot ==
                    //             true
                    //         ? AppColors.green
                    //         : _quizController.selectedOptions[questionNumber]
                    //                     .value ==
                    //                 optionNumber
                    //             ? AppColors.red
                    //             : AppColors.black,
                    )),
          ),
        ),
      ],
    );
  }
}
