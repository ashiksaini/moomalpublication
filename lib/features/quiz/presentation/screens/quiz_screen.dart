import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/quiz/presentation/template/tab_bar.dart';

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
            CustomTabBar(
              tabLength: 2,
              context: context,
            ),
           
          ],
        ),
      ),
    );
  }
}
