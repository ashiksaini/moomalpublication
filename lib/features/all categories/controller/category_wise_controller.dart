import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/enums.dart';
import 'package:moomalpublication/core/utils/shared_data.dart';

class CategoryWiseController extends BaseController {
  late SharedData sharedData;
  final RxBool includeOutOfStockItem = RxBool(false);

  @override
  void onInit() {
    super.onInit();

    sharedData = Get.arguments as SharedData;
  }

  void onFilterItemClick(SortBy sortBy) {
    switch (sortBy) {
      case SortBy.averageRating:
        break;

      case SortBy.popularity:
        break;

      case SortBy.priceHToL:
        break;

      case SortBy.priceLToH:
        break;
      default:
    }
  }

  void canIncludeOutOfStockItem(bool? value) {
    includeOutOfStockItem.value = value ?? false;
  }
}
