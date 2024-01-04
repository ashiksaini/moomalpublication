import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/home/data/models/drop_down_item.dart';
import 'package:moomalpublication/features/test_series/data/constants/type_alias.dart';
import 'package:moomalpublication/features/test_series/data/models/tab_bar_model.dart';
import 'package:moomalpublication/features/test_series/data/models/term_model.dart';
import 'package:moomalpublication/features/test_series/data/models/test_series_response_model.dart';
import 'package:moomalpublication/features/test_series/data/services/test_series_service.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class TestSeriesController extends BaseController {
  RxBool listgrid = RxBool(false);
  final Rx<TestSeriesResponse> testSeriesResponse = Rx(TestSeriesResponse());
  final RxList<TestSeriesResponseModel> tests =
      RxList<TestSeriesResponseModel>();

  final Rx<TestSeriesListResponse> testSeriesListResponse =
      Rx(TestSeriesListResponse());

  List<DropdownItem<Term>> mockTestCategory = RxList<DropdownItem<Term>>();
  late Rx<DropdownItem<Term>?> selectedMockTestCategory =
      Rx<DropdownItem<Term>?>(null);

  List<DropdownItem<Term>> topicWiseCategory = RxList<DropdownItem<Term>>();
  late Rx<DropdownItem<Term>?> selectedTopicWiseCategory =
      Rx<DropdownItem<Term>?>(null);

  RxBool pageLoaded = false.obs;
  List<TabBarModel> tabBarList = [];
  RxInt slectedIndexOfTab = 0.obs;

  @override
  void onInit() {
    super.onInit();
    tabBarListGenerate();
    _getTestDropDownList();
  }

  Future<void> _getTestList(
      {required String typeCategory, required int category}) async {
    testSeriesResponse.value = ApiResponse.loading();
    testSeriesResponse.value =
        await TestSeriesService.getTests(query: {'category': category});

    if (testSeriesResponse.value.data != null) {
      tests.clear();
      tests.addAll(testSeriesResponse.value.data!);
      isPageLoaded();
    } else {
      showSnackBar(AppConstants.somethingWentWrong);
    }
  }

  Future<void> _getTestDropDownList() async {
    testSeriesListResponse.value = ApiResponse.loading();
    testSeriesListResponse.value = await TestSeriesService.getTestList();

    if (testSeriesListResponse.value.data != null) {
      for (var item in testSeriesListResponse.value.data!) {
        if (item.mockTestTerms != null) {
          for (var category in item.mockTestTerms!.values) {
            mockTestCategory
                .add(DropdownItem(title: category.name ?? "", type: category));
          }
          selectedMockTestCategory.value = mockTestCategory.first;
        }

        if (item.topicWiseTerms != null) {
          for (var category in item.topicWiseTerms!.values) {
            topicWiseCategory
                .add(DropdownItem(title: category.name ?? "", type: category));
          }
        }

        if (mockTestCategory.isNotEmpty && topicWiseCategory.isNotEmpty) {
          selectedMockTestCategory.value = mockTestCategory.first;
          selectedTopicWiseCategory.value = topicWiseCategory.first;
          _getTestList(
              typeCategory: selectedMockTestCategory.value?.title ?? '',
              category: tabBarList[slectedIndexOfTab.value].tabId ?? 0);
        }
      }
    } else {
      showSnackBar(AppConstants.somethingWentWrong);
    }
  }

  void tabBarListGenerate() {
    tabBarList.addAll([
      TabBarModel(
        tabName: 'all'.tr,
        tabId: 12,
      ),
      TabBarModel(
        tabName: 'full_length'.tr,
        tabId: 58,
      ),
      TabBarModel(
        tabName: 'sectional'.tr,
        tabId: 56,
      )
    ]);
  }

  void onMockCategoryItemClick(DropdownItem<Term> item) {
    selectedMockTestCategory.value = item;
    tests.clear();
    _getTestList(
        typeCategory: selectedMockTestCategory.string,
        category: tabBarList[slectedIndexOfTab.value].tabId ?? 0);
  }

  void onTopicCategoryItemClick(DropdownItem<Term> item) {
    selectedTopicWiseCategory.value = item;
    tests.clear();
    _getTestList(
        typeCategory: selectedTopicWiseCategory.string,
        category: tabBarList[slectedIndexOfTab.value].tabId ?? 0);
  }

  RxBool listOrGrid() {
    return listgrid;
  }

  void isPageLoaded() {
    pageLoaded.value =
        mockTestCategory.isNotEmpty && topicWiseCategory.isNotEmpty;
  }

  void setSelectedTabIndex({required int selectedIndex}) {
    slectedIndexOfTab.value = selectedIndex;
    _getTestList(
        typeCategory: selectedMockTestCategory.value?.title ?? '',
        category: tabBarList[slectedIndexOfTab.value].tabId ?? 0);
  }
}
