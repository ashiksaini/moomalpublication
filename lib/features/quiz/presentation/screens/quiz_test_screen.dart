import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/quiz/controller/quiz_controller.dart';
import 'package:moomalpublication/features/quiz/data/models/timer_model.dart';
import 'package:moomalpublication/features/quiz/presentation/template/questions_list_card.dart';
import 'package:moomalpublication/features/quiz/presentation/widgets/test_submit_button.dart';
import 'package:moomalpublication/routes/routing.dart';

class QuizTestScreen extends StatelessWidget {
  QuizTestScreen({super.key});
  final QuizController _quizController = Get.put(QuizController());
  final TimerModel timerModel = TimerModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              title: "Current Affair Quiz June 2021",
              maxLine: 1,
              prefixIcon: AppAssets.icBackArrow,
              onPrefixIconClick: () => AppRouting.navigateBack(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: scaleHeight(18, context),
                      horizontal: scaleWidth(16, context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShadowContainer(
                        borderRadius: scaleRadius(6, context),
                        containerChild: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: scaleHeight(12, context),
                              horizontal: scaleWidth(12, context)),
                          child: Obx(
                            () => CustomText(
                              text:
                                  'Timer - ${timerModel.formattedTime(_quizController.counter.value)}',
                              textStyle: CustomTextStyle.textStyle20Bold(
                                  context,
                                  color: AppColors.black),
                            ),
                          ),
                        ),
                      ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _quizController.questionsList.length,
                          itemBuilder: (context, index) {
                            return QuestionListCard(
                              questionNumberIndex: index,
                            );
                          }),
                      TestSubmitButton(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
