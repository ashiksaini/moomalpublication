import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/test_series/controller/test_series_controller.dart';
import 'package:moomalpublication/features/test_series/data/constants/enums.dart';
import 'package:moomalpublication/features/test_series/presentation/template/tab_list.dart';
import 'package:moomalpublication/features/test_series/presentation/widgets/main_tab_item.dart';
import 'package:moomalpublication/features/test_series/presentation/widgets/sub_tab_item.dart';
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
  final TestSeriesController _testSeriesController =
      Get.put(TestSeriesController());

  final tabs = <Widget>[];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Container(
          color: AppColors.white,
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
                  () => (_testSeriesController
                          .testSeriesListResponse.value.isLoading)
                      ? Center(child: customProgressIndicator())
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _getMainTab(),
                            if (_testSeriesController
                                    .selectedMainTestType.value ==
                                TestSeriesMainTabType.subjests)
                              _getSubjectsSubTabs(),
                            if (_testSeriesController
                                    .selectedMainTestType.value ==
                                TestSeriesMainTabType.topics)
                              _getTopicsSubTabs(),
                            const VerticalGap(size: 40),
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
                                  length: _testSeriesController.testsAll.length,
                                ),
                                TabItem(
                                  text: _testSeriesController
                                          .tabBarList[1].tabName ??
                                      '',
                                  length: _testSeriesController
                                      .testsFullLength.length,
                                ),
                                TabItem(
                                  text: _testSeriesController
                                          .tabBarList[2].tabName ??
                                      '',
                                  length: _testSeriesController
                                      .testsSectional.length,
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
                                            entries:
                                                _testSeriesController.testsAll,
                                            onRefresh:
                                                _testSeriesController.onRefresh,
                                          ),
                                          TabList(
                                            entries: _testSeriesController
                                                .testsFullLength,
                                            onRefresh:
                                                _testSeriesController.onRefresh,
                                          ),
                                          TabList(
                                            entries: _testSeriesController
                                                .testsSectional,
                                            onRefresh:
                                                _testSeriesController.onRefresh,
                                          ),
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
      ),
    );
  }

  Widget _getTopicsSubTabs() {
    return Container(
      width: SizeUtils.width,
      height: 40.v,
      padding: EdgeInsets.symmetric(horizontal: 14.h),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: _testSeriesController.topicWiseCategory.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.only(right: 10.h),
            child: SubTabItem(
              title: _testSeriesController.topicWiseCategory[index].name ?? "",
              term: _testSeriesController.topicWiseCategory[index],
              isSelected: _testSeriesController
                  .topicWiseCategory[index].isSelected.value,
              onClick: (term) => _testSeriesController.onSubTopicClick(term),
            ),
          );
        },
      ),
    );
  }

  Widget _getSubjectsSubTabs() {
    return Container(
      width: SizeUtils.height,
      height: 40.v,
      padding: EdgeInsets.symmetric(horizontal: 14.h),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: _testSeriesController.mockTestCategory.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.only(right: 10.h),
            child: SubTabItem(
              title: _testSeriesController.mockTestCategory[index].name ?? "",
              term: _testSeriesController.mockTestCategory[index],
              isSelected: _testSeriesController
                  .mockTestCategory[index].isSelected.value,
              onClick: (term) => _testSeriesController.onSubTopicClick(term),
            ),
          );
        },
      ),
    );
  }

  Widget _getMainTab() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 20.v),
      child: Row(
        children: [
          MainTabItem(
            title: "all".tr,
            isSelected: _testSeriesController.selectedMainTestType.value ==
                TestSeriesMainTabType.all,
            onClick: (testSeriesMainTabType) =>
                _testSeriesController.onMainTabsClick(testSeriesMainTabType),
            testSeriesMainTabType: TestSeriesMainTabType.all,
          ),
          const HorizontalGap(size: 14),
          Expanded(
            child: MainTabItem(
              title: "subjects".tr,
              isSelected: _testSeriesController.selectedMainTestType.value ==
                  TestSeriesMainTabType.subjests,
              onClick: (testSeriesMainTabType) =>
                  _testSeriesController.onMainTabsClick(testSeriesMainTabType),
              testSeriesMainTabType: TestSeriesMainTabType.subjests,
            ),
          ),
          const HorizontalGap(size: 14),
          Expanded(
            child: MainTabItem(
              title: "topics".tr,
              isSelected: _testSeriesController.selectedMainTestType.value ==
                  TestSeriesMainTabType.topics,
              onClick: (testSeriesMainTabType) =>
                  _testSeriesController.onMainTabsClick(testSeriesMainTabType),
              testSeriesMainTabType: TestSeriesMainTabType.topics,
            ),
          ),
        ],
      ),
    );
  }
}
