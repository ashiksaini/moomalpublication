import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

class SettingController extends BaseController {
  void navigateSettingDetailScreen({required String appBarTitle, required String description}) {
    AppRouting.toNamed(NameRoutes.settingDetailScreen, argument: [
      {"appBarTitle": appBarTitle},
      {"description": description},
    ]);
  }
}
