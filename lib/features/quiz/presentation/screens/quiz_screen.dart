import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/quiz/controller/quiz_controller.dart';
import 'package:moomalpublication/features/quiz/presentation/template/current_affair_quiz_card.dart';
import 'package:moomalpublication/routes/routing.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final QuizController _quizController = Get.put(QuizController());
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              title: "our_quiz".tr,
              maxLine: 1,
              prefixIcon: AppAssets.icBackArrow,
              onPrefixIconClick: () => AppRouting.navigateBack(),
            ),
            const VerticalGap(size: 32),
            TabBar(
              unselectedLabelColor: AppColors.black,
              labelColor: AppColors.orange,
              dividerColor: AppColors.grey,
              labelStyle: CustomTextStyle.textStyle25Bold(context),
              unselectedLabelStyle: CustomTextStyle.textStyle25Bold(context),
              indicatorColor: AppColors.orange,
              tabs: [
                Tab(
                  text: 'current_affair_quiz'.tr,
                ),
                Tab(
                  text: 'economics_quiz'.tr,
                ),
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: Obx(
                () => (_quizController.quizResponse.value.isLoading)
                    ? Center(child: customProgressIndicator())
                    : TabBarView(
                        controller: _tabController,
                        children: [
                          ListView.builder(
                              itemCount: _quizController.quizList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CurrentAffairQuizCard(index: index);
                              }),
                          ListView.builder(
                              itemCount: _quizController.quizList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CurrentAffairQuizCard(index: index);
                              }),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
