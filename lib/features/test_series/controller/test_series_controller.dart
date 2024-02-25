import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/utils/extensions.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/home/data/models/drop_down_item.dart';
import 'package:moomalpublication/features/test_series/data/constants/type_alias.dart';
import 'package:moomalpublication/features/test_series/data/models/tab_bar_model.dart';
import 'package:moomalpublication/features/test_series/data/models/term_model.dart';
import 'package:moomalpublication/features/test_series/data/models/test_series_response_model.dart';
import 'package:moomalpublication/features/test_series/data/services/test_series_service.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class TestSeriesController extends BaseController {
  List<TabBarModel> tabBarList = [];

  final Rx<TestSeriesResponse> testSeriesResponse = Rx(TestSeriesResponse());
  final Rx<TestSeriesListResponse> testSeriesListResponse =
      Rx(TestSeriesListResponse());

  final RxList<TestSeriesResponseModel> testsAll =
      RxList<TestSeriesResponseModel>();
  final RxList<TestSeriesResponseModel> testsFullLength =
      RxList<TestSeriesResponseModel>();
  final RxList<TestSeriesResponseModel> testsSectional =
      RxList<TestSeriesResponseModel>();

  List<DropdownItem<Term>> mockTestCategory = RxList<DropdownItem<Term>>();
  late Rx<DropdownItem<Term>?> selectedMockTestCategory =
      Rx<DropdownItem<Term>?>(null);

  List<DropdownItem<Term>> topicWiseCategory = RxList<DropdownItem<Term>>();
  late Rx<DropdownItem<Term>?> selectedTopicWiseCategory =
      Rx<DropdownItem<Term>?>(null);

  @override
  void onInit() {
    super.onInit();
    _setDefaultMockCategoryValue();
    _setDefaultTopicWiseCategoryValue();
    _tabBarListGenerate();
    _getTestDropDownList();
    _getTestList();
  }

  void _tabBarListGenerate() {
    tabBarList.addAll([
      TabBarModel(
        tabName: 'all'.tr,
        tabId: 12,
        testList: RxList<TestSeriesResponseModel>(),
      ),
      TabBarModel(
        tabName: 'full_length'.tr,
        tabId: 58,
        testList: RxList<TestSeriesResponseModel>(),
      ),
      TabBarModel(
        tabName: 'sectional'.tr,
        tabId: 56,
        testList: RxList<TestSeriesResponseModel>(),
      )
    ]);
  }

  Future<void> _getTestDropDownList() async {
    testSeriesListResponse.value = ApiResponse.loading();
    testSeriesListResponse.value = await TestSeriesService.getTestList();

    if (testSeriesListResponse.value.data != null) {
      if (testSeriesListResponse.value.data!.mockTestTerms != null) {
        for (var category
            in testSeriesListResponse.value.data!.mockTestTerms!.values) {
          mockTestCategory
              .add(DropdownItem(title: category.name ?? "", type: category));
        }
      }

      if (testSeriesListResponse.value.data!.topicWiseTerms != null) {
        for (var category
            in testSeriesListResponse.value.data!.topicWiseTerms!.values) {
          topicWiseCategory
              .add(DropdownItem(title: category.name ?? "", type: category));
        }
      }
    } else {
      showSnackBar(AppConstants.somethingWentWrong);
    }
  }

  Future<void> _getTestList({int? category}) async {
    testSeriesResponse.value = ApiResponse.loading();
    testSeriesResponse.value =
        await TestSeriesService.getTests(query: _getQueryParams(category));

    if (testSeriesResponse.value.data != null &&
        testSeriesResponse.value.data!.isNotEmpty) {
      for (var test in testSeriesResponse.value.data!) {
        testsAll.add(test);

        if (test.testTypeTerms!.isNotEmpty) {
          if (test.testTypeTerms!
              .containsWithIgnoreCases(AppConstants.sectional)) {
            testsSectional.add(test);
          } else if (test.testTypeTerms!
              .containsWithIgnoreCases(AppConstants.fullLength)) {
            testsFullLength.add(test);
          }
        }
      }
    } else {
      showSnackBar(AppConstants.somethingWentWrong);
    }
  }

  void onMockCategoryItemClick(DropdownItem<Term> item) {
    selectedMockTestCategory.value = item;
    _setDefaultTopicWiseCategoryValue();
    _clearList();
    _getTestList(category: selectedMockTestCategory.value?.type.termId ?? 0);
  }

  void onTopicCategoryItemClick(DropdownItem<Term> item) {
    selectedTopicWiseCategory.value = item;
    _setDefaultMockCategoryValue();
    _clearList();
    _getTestList(category: selectedTopicWiseCategory.value?.type.termId ?? 0);
  }

  void _clearList() {
    testsAll.clear();
    testsFullLength.clear();
    testsSectional.clear();
  }

  void onRefresh() {
    _setDefaultMockCategoryValue();
    _setDefaultTopicWiseCategoryValue();
    _clearList();
    _getTestList();
  }

  Map<String, dynamic>? _getQueryParams(int? category) {
    if (category == null) {
      return null;
    }

    Map<String, dynamic> query = {};
    query.putIfAbsent('category', () => category);
    return query;
  }

  void _setDefaultMockCategoryValue() {
    selectedMockTestCategory.value =
        DropdownItem(title: "mock_test_category".tr, type: Term());
  }

  void _setDefaultTopicWiseCategoryValue() {
    selectedTopicWiseCategory.value =
        DropdownItem(title: "topicwise_category".tr, type: Term());
  }
}
