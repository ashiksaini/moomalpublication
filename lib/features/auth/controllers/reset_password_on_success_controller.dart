import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/routes/routing.dart';

class ResetPasswordOnSuccessController extends BaseController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 3), () => AppRouting.navigateBack());
  }
}
