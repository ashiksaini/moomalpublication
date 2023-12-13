import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/quiz/presentation/template/current_affair_quiz_card.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppbar(
              title: "Our Quiz",
              maxLine: 1,
              prefixIcon: AppAssets.icBackArrow,
            ),
            const VerticalGap(size: 32),
            // CustomTabBar(
            //   tabLength: 2,
            //   context: context,
            // ),
            TabBar(
              unselectedLabelColor: AppColors.black,
              labelColor: AppColors.orange,
              dividerColor: AppColors.grey,
              labelStyle: CustomTextStyle.textStyle25Bold(context),
              unselectedLabelStyle: CustomTextStyle.textStyle25Bold(context),
              indicatorColor: AppColors.orange,
              tabs: const [
                Tab(
                  text: 'Current affair Quiz',
                ),
                Tab(
                  text: 'Economics Quiz',
                ),
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return const CurrentAffairQuizCard();
                      }),
                  ListView.builder(
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return const CurrentAffairQuizCard();
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
