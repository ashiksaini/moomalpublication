import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/quiz/controller/quiz_controller.dart';
import 'package:moomalpublication/features/quiz/presentation/template/photo_description.dart';
import 'package:moomalpublication/routes/routing.dart';

class QuizDetailScreen extends StatelessWidget {
  QuizDetailScreen({super.key});

  final args = Get.arguments;
  final QuizController _quizController = Get.find<QuizController>();
  @override
  Widget build(BuildContext context) {
    int index = args[0]['index'];
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Container(
          color: AppColors.white,
          child: Column(
            children: [
              CustomAppbar(
                title: _quizController.quizList[index].quizName ?? '',
                maxLine: 1,
                prefixIcon: AppAssets.icBackArrow,
                onPrefixIconClick: () => AppRouting.navigateBack(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 30.v,
                        horizontal: 30.h),
                    child: ShadowContainer(
                      containerChild: PhotoDescription(
                        index: index,
                      ),
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
