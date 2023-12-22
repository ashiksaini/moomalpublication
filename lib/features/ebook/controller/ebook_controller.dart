import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/features/home/data/constants/drop_down_item_type.dart';
import 'package:moomalpublication/features/home/data/models/drop_down_item.dart';

class EbookController extends BaseController {
  List<DropdownItem<Category>> ebookCategories = [];
  late Rx<DropdownItem<Category>?> selectedCategories = Rx(null);

  @override
  void onInit() {
    super.onInit();
    _initCategoriesList();
    ();
  }

  void _initCategoriesList() {
    final cat1 = DropdownItem(title: "cat1".tr, type: Category.cat1);
    final cat2 = DropdownItem(title: "cat2".tr, type: Category.cat2);
    ebookCategories.addAll([cat1, cat2]);
    selectedCategories.value = ebookCategories.first;
  }

  
}
