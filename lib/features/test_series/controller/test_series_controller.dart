import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/home/data/constants/drop_down_item_type.dart';
import 'package:moomalpublication/features/home/data/models/drop_down_item.dart';
import 'package:moomalpublication/features/test_series/data/constants/type_alias.dart';
import 'package:moomalpublication/features/test_series/data/models/term_model.dart';
import 'package:moomalpublication/features/test_series/data/models/test_series_response_model.dart';
import 'package:moomalpublication/features/test_series/data/services/test_series_service.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class TestSeriesController extends BaseController {
  RxBool listgrid = RxBool(false);
  final Rx<TestSeriesResponse> testSeriesResponse = Rx(TestSeriesResponse());
  final List<TestSeriesResponseModel> tests = [];

  final Rx<TestSeriesListResponse> testSeriesListResponse =
      Rx(TestSeriesListResponse());
  final List<Term> mockTestTermsList = <Term>[];
  final List<Term> topicWiseTermsList = <Term>[];

  List<DropdownItem<MockTest>> mockTestCategory = [];
  late Rx<DropdownItem<MockTest>?> selectedMockTestCategory = Rx(null);

  List<DropdownItem<TopicWiseTest>> topicWiseCategory = [];
  late Rx<DropdownItem<TopicWiseTest>?> selectedTopicWiseCategory = Rx(null);

  @override
  void onInit() {
    super.onInit();
    _initCategoriesList();
    _getTestList();
    _getTestDropDownList();
    ();
  }

  Future<void> _getTestList() async {
    testSeriesResponse.value = ApiResponse.loading();
    testSeriesResponse.value = await TestSeriesService.getTests();

    if (testSeriesResponse.value.data != null) {
      tests.clear();
      tests.addAll(testSeriesResponse.value.data!);
    } else {
      showSnackBar(AppConstants.somethingWentWrong);
    }
  }

  Future<void> _getTestDropDownList() async {
    testSeriesListResponse.value = ApiResponse.loading();
    testSeriesListResponse.value = await TestSeriesService.getTestList();

    if (testSeriesListResponse.value.data != null) {
      mockTestTermsList.clear();
      topicWiseTermsList.clear();

      for (var item in testSeriesListResponse.value.data!) {
        if (item.mockTestTerms != null) {
          mockTestTermsList.addAll(item.mockTestTerms!.values);
        }

        if (item.topicWiseTerms != null) {
          topicWiseTermsList.addAll(item.topicWiseTerms!.values);
        }
      }
    } else {
      showSnackBar(AppConstants.somethingWentWrong);
    }
  }

  void _initCategoriesList() {
    final a = DropdownItem(title: "cat1".tr, type: MockTest.a);
    final b = DropdownItem(title: "cat2".tr, type: MockTest.b);
    final c = DropdownItem(title: "cat3".tr, type: MockTest.c);

    mockTestCategory.addAll([a, b, c]);
    selectedMockTestCategory.value = mockTestCategory.first;

    final a1 = DropdownItem(title: "cat1".tr, type: TopicWiseTest.a);
    final b2 = DropdownItem(title: "cat2".tr, type: TopicWiseTest.b);
    final c3 = DropdownItem(title: "cat3".tr, type: TopicWiseTest.c);

    topicWiseCategory.addAll([a1, b2, c3]);
    selectedTopicWiseCategory.value = topicWiseCategory.first;
  }

  RxBool listOrGrid() {
    return listgrid;
  }
}
