import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 2), () => AppRouting.offAndToNamed(NameRoutes.signinScreen));
  }
}
