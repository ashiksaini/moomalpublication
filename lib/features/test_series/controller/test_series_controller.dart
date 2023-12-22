import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/features/home/data/constants/drop_down_item_type.dart';
import 'package:moomalpublication/features/home/data/models/drop_down_item.dart';

class TestSeriesController extends BaseController {
  RxBool listgrid = RxBool(false);

  List<DropdownItem<MockTest>> mockTestCategory = [];
  late Rx<DropdownItem<MockTest>?> selectedMockTestCategory = Rx(null);

  List<DropdownItem<TopicWiseTest>> topicWiseCategory = [];
  late Rx<DropdownItem<TopicWiseTest>?> selectedTopicWiseCategory = Rx(null);

  @override
  void onInit() {
    super.onInit();
    _initCategoriesList();
    ();
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
