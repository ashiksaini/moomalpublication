import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/features/detail_page/presentation/widgets/description_tab.dart';

class BookDetailTabBar extends StatefulWidget {
  const BookDetailTabBar({super.key});

  @override
  _BookDetailTabBarState createState() => _BookDetailTabBarState();
}

class _BookDetailTabBarState extends State<BookDetailTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController colorController = TextEditingController();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TabBar(
          unselectedLabelColor: Colors.black,
          labelColor: AppColors.green,
          dividerColor: AppColors.grey,
          labelStyle: CustomTextStyle.textStyle25Bold(context),
          unselectedLabelStyle: CustomTextStyle.textStyle25Bold(context),
          indicatorColor: AppColors.green,
          tabs: const [
            Tab(
              text: 'Description',
            ),
            Tab(
              text: 'Information',
            ),
          ],
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.7),
          child: TabBarView(
            controller: _tabController,
            children: [DescriptionTabSceen(), Text("jhdfg")],
          ),
        ),
      ],
    );
  }
}
