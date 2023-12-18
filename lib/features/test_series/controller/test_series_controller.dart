import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';

class TestSeriesController extends BaseController {
  RxBool listgrid = RxBool(false);

  RxBool listOrGrid() {
    return listgrid;
  }
}
