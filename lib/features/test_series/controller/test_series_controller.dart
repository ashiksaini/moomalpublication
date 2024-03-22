import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/utils/extensions.dart';
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:moomalpublication/features/test_series/data/constants/enums.dart';
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

  List<Term> mockTestCategory = RxList<Term>();
  late Rx<Term?> selectedMockTestCategory = Rx<Term?>(null);

  List<Term> topicWiseCategory = RxList<Term>();
  late Rx<Term?> selectedTopicWiseCategory = Rx<Term?>(null);

  Rx<TestSeriesMainTabType> selectedMainTestType =
      Rx(TestSeriesMainTabType.all);
  Rx<Term?> selectedTerm = Rx(null);

  @override
  void onInit() {
    super.onInit();
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
          mockTestCategory.add(category);
        }
      }

      if (testSeriesListResponse.value.data!.topicWiseTerms != null) {
        for (var category
            in testSeriesListResponse.value.data!.topicWiseTerms!.values) {
          topicWiseCategory.add(category);
        }
      }
    } else {
      showToast(AppConstants.somethingWentWrong);
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
      showToast(AppConstants.somethingWentWrong);
    }
  }

  void _clearList() {
    testsAll.clear();
    testsFullLength.clear();
    testsSectional.clear();
  }

  void onRefresh() {
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

  void onMainTabsClick(TestSeriesMainTabType testSeriesMainTabType) {
    selectedMainTestType.value = testSeriesMainTabType;
    _clearList();

    switch (testSeriesMainTabType) {
      case TestSeriesMainTabType.all:
      case TestSeriesMainTabType.subjests:
      case TestSeriesMainTabType.topics:
        _getTestList();
    }
  }

  void onSubTopicClick(Term term) {
    selectedTerm.value?.isSelected.value = false;
    term.isSelected.value = true;
    selectedTerm.value = term;

    _clearList();
    _getTestList(category: term.termId);
  }
}
