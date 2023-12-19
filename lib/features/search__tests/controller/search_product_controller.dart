import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_rx/src/rx_workers/rx_workers.dart';
import 'package:moomalpublication/core/base/base_controller.dart';

class SearchTestController extends BaseController {
  RxString searchedText = RxString("");

  @override
  void onInit() {
    super.onInit();

    debounce(searchedText, (_) => _initDebounce(),
        time: const Duration(seconds: 1));
  }

  void _initDebounce() {}
}
