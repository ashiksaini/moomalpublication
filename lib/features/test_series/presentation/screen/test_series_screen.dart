import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/components/organisms/custom_drop_down_2.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/test_series/controller/test_series_controller.dart';
import 'package:moomalpublication/features/test_series/presentation/template/tab_list.dart';
import 'package:moomalpublication/features/test_series/presentation/widgets/list_grid_row.dart';
import 'package:moomalpublication/routes/routing.dart';

class TestSeriesScreen extends StatefulWidget {
  @override
  _TestSeriesScreenState createState() => _TestSeriesScreenState();
}

class _TestSeriesScreenState extends State<TestSeriesScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController colorController = TextEditingController();
  final TestSeriesController _testSeriesController = Get.put(TestSeriesController());

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
      backgroundColor: AppColors.white,
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
              padding: EdgeInsets.only(top: scaleHeight(14, context), left: scaleWidth(10, context), right: scaleWidth(10, context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // CustomDropDown2(
                  //   borderRadius: 10,
                  //   borderColor: AppColors.orange,
                  //   items: _testSeriesController.mockTestCategory,
                  //   selectedItem: _testSeriesController.selectedMockTestCategory,
                  //   width: screenWidth(context) - scaleWidth(200, context),
                  // ),
                  // CustomDropDown2(
                  //   borderRadius: 10,
                  //   borderColor: AppColors.orange,
                  //   items: _testSeriesController.topicWiseCategory,
                  //   selectedItem: _testSeriesController.selectedTopicWiseCategory,
                  //   width: screenWidth(context) - scaleWidth(200, context),
                  // ),
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
