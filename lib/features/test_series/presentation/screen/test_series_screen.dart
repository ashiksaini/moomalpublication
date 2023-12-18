import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/features/test_series/presentation/template/drop_down_menu.dart';
import 'package:moomalpublication/features/test_series/presentation/template/list_card.dart';
import 'package:moomalpublication/features/test_series/presentation/template/tab_list.dart';
import 'package:moomalpublication/features/test_series/presentation/widgets/list_grid_row.dart';
import 'package:moomalpublication/features/test_series/presentation/widgets/marks_row.dart';
import 'package:moomalpublication/routes/routing.dart';

class TestSeriesScreen extends StatefulWidget {
  @override
  _TestSeriesScreenState createState() => _TestSeriesScreenState();
}

class _TestSeriesScreenState extends State<TestSeriesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController colorController = TextEditingController();

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppbar(
              title: "Test Series",
              prefixIcon: AppAssets.icBackArrow,
              suffixIcon: AppAssets.icSearch,
              onPrefixIconClick: () => AppRouting.navigateBack(),
              maxLine: 1,
            ),
            Padding(
              padding: EdgeInsets.only(top: scaleHeight(14, context)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownMenuExample(
                    itemList: ['a', 'b', 'c'],
                    dropDownText: 'All Mock Test',
                  ),
                  DropdownMenuExample(
                    itemList: ['a', 'c', 'd'],
                    dropDownText: 'Topic Wise Test',
                  )
                ],
              ),
            ),
            const ListGridRow(),
            TabBar(
              unselectedLabelColor: AppColors.black,
              labelColor: AppColors.orange,
              dividerColor: AppColors.grey,
              indicatorColor: AppColors.orange,
              tabs: const [
                Tab(
                  text: 'All(5)',
                ),
                Tab(
                  text: 'Full length(5)',
                ),
                Tab(
                  text: 'Sectional(3)',
                )
              ],
              labelStyle: CustomTextStyle.textStyle20Bold(context),
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  TabList(
                    entries: ['A', 'B', 'C'],
                  ),
                  TabList(
                    entries: ['A', 'B', 'C'],
                  ),
                  TabList(
                    entries: ['A', 'B', 'C'],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
