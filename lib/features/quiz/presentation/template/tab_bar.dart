import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';

class CustomTabBar extends StatefulWidget {
  final int tabLength;
  final Color labelColor;
  final Color dividerColor;
  final Color indicatorColor;
  final Color unselectedLabelColor;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;
  final BuildContext context;

  CustomTabBar({
    super.key,
    required this.tabLength,
    this.dividerColor = AppColors.grey,
    this.indicatorColor = AppColors.orange,
    this.unselectedLabelColor = AppColors.black,
    this.labelColor = AppColors.orange,
    required this.context,
    labelStyle,
    unselectedLabelStyle,
  })  : labelStyle = labelStyle ?? CustomTextStyle.textStyle25Bold(context),
        unselectedLabelStyle =
            unselectedLabelStyle ?? CustomTextStyle.textStyle25Bold(context);

  @override
  CustomTabBarState createState() => CustomTabBarState();
}

class CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: widget.tabLength, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            unselectedLabelColor: widget.unselectedLabelColor,
            labelColor: widget.labelColor,
            dividerColor: widget.dividerColor,
            labelStyle: widget.labelStyle,
            unselectedLabelStyle: widget.unselectedLabelStyle,
            indicatorColor: widget.indicatorColor,
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
                // ListView.builder(
                //     itemCount: 3,
                //     itemBuilder: (BuildContext context, int index) {
                //       return CurrentAffairQuizCard();
                //     }),
                Text(""),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
