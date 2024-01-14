import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/components/organisms/custom_drop_down_2.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/test_series/controller/test_series_controller.dart';
import 'package:moomalpublication/features/test_series/presentation/template/tab_list.dart';
import 'package:moomalpublication/features/test_series/presentation/widgets/tab_item.dart';
import 'package:moomalpublication/routes/routing.dart';

class TestSeriesScreen extends StatefulWidget {
  const TestSeriesScreen({Key? key}) : super(key: key);

  @override
  State<TestSeriesScreen> createState() => _TestSeriesScreenState();
}

class _TestSeriesScreenState extends State<TestSeriesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController colorController = TextEditingController();
  final TestSeriesController _testSeriesController =
      Get.put(TestSeriesController());

  final tabs = <Widget>[];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      int selectedIndex = _tabController.index;
      _testSeriesController.setSelectedTabIndex(selectedIndex: selectedIndex);
    });
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
              title: "test_series".tr.replaceAll('\n', ' '),
              prefixIcon: AppAssets.icBackArrow,
              onPrefixIconClick: () => AppRouting.navigateBack(),
              maxLine: 1,
            ),
            Expanded(
              child: Obx(
                () => (!_testSeriesController.pageLoaded.value)
                    ? Center(child: customProgressIndicator())
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: scaleHeight(14, context),
                              left: scaleWidth(10, context),
                              right: scaleWidth(10, context),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomDropDown2(
                                  borderColor: AppColors.orange,
                                  items: _testSeriesController.mockTestCategory,
                                  selectedItem: _testSeriesController
                                      .selectedMockTestCategory,
                                  width: screenWidth(context) / 2.2,
                                  onItemClick: _testSeriesController
                                      .onMockCategoryItemClick,
                                ),
                                CustomDropDown2(
                                  borderColor: AppColors.orange,
                                  items:
                                      _testSeriesController.topicWiseCategory,
                                  selectedItem: _testSeriesController
                                      .selectedTopicWiseCategory,
                                  width: screenWidth(context) / 2.2,
                                  onItemClick: _testSeriesController
                                      .onTopicCategoryItemClick,
                                ),
                              ],
                            ),
                          ),
                          const VerticalGap(size: 30),
                          TabBar(
                            unselectedLabelColor: AppColors.black,
                            labelColor: AppColors.orange,
                            dividerColor: AppColors.grey,
                            indicatorColor: AppColors.orange,
                            tabs: [
                              TabItem(
                                text: _testSeriesController
                                        .tabBarList[0].tabName ??
                                    '',
                                length: _testSeriesController
                                    .tabBarList[0].testList!.length,
                              ),
                              TabItem(
                                text: _testSeriesController
                                        .tabBarList[1].tabName ??
                                    '',
                                length: _testSeriesController
                                    .tabBarList[1].testList!.length,
                              ),
                              TabItem(
                                text: _testSeriesController
                                        .tabBarList[2].tabName ??
                                    '',
                                length: _testSeriesController
                                    .tabBarList[2].testList!.length,
                              ),
                            ],
                            labelStyle:
                                CustomTextStyle.textStyle20Bold(context),
                            controller: _tabController,
                            indicatorSize: TabBarIndicatorSize.tab,
                          ),
                          Expanded(
                            child: Obx(
                              () => (_testSeriesController
                                      .testSeriesResponse.value.isLoading)
                                  ? Center(child: customProgressIndicator())
                                  : TabBarView(
                                      controller: _tabController,
                                      children: [
                                        TabList(
                                          entries: _testSeriesController
                                              .tabBarList[0].testList!,
                                        ),
                                        TabList(
                                            entries: _testSeriesController
                                                .tabBarList[1].testList!),
                                        TabList(
                                            entries: _testSeriesController
                                                .tabBarList[2].testList!),
                                      ],
                                    ),
                            ),
                          ),
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
