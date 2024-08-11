import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/quiz/controller/quiz_controller.dart';
import 'package:moomalpublication/features/quiz/presentation/widgets/options_card.dart';

class QuestionListCard extends StatelessWidget {
  QuestionListCard({super.key, required this.questionNumberIndex});
  final int questionNumberIndex;

  final QuizController _quizController = Get.find<QuizController>();
  // final QuizController _quizController = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 28.v),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // CustomText(
                //   textAlign: TextAlign.start,
                //   text:
                //       (questionNumberIndex + 1).toString(),
                //   textStyle: CustomTextStyle.textStyle15Bold(context),
                // ),

                Expanded(
                    child: Html(
                        data:
                            "${questionNumberIndex + 1}. ${_quizController.questionsList[questionNumberIndex].value}"))
              ],
            ),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _quizController.optionsName.length,
              itemBuilder: (context, optionIndex) {
                return GestureDetector(
                  onTap: () {
                    _quizController.testTaken.isFalse
                        ? _quizController.selectedOption(
                            questionNumber: questionNumberIndex,
                            optionNumber: optionIndex)
                        : null;
                  },
                  child: OptionsCard(
                      questionNumber: questionNumberIndex,
                      optionNumber: optionIndex),
                );
              }),
        ],
      ),
    );
  }
}
