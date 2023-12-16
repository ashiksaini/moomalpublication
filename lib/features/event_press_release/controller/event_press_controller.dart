import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

class EventPressController extends BaseController {
  RxList<bool> eventsReadMoreList = RxList([false, false, false]);

  void readMore(int index) {
    eventsReadMoreList[index] = !eventsReadMoreList[index];
  }

  bool getReadMore(int index) {
   return eventsReadMoreList[index];
  }

  void navigateSettingDetailScreen({required String appBarTitle}) {
    AppRouting.toNamed(NameRoutes.detailEventScreen, argument: [
      {"appBarTitle": appBarTitle}
    ]);
  }
}
