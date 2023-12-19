import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/event_press_release/data/constants/type_alias.dart';
import 'package:moomalpublication/features/event_press_release/data/models/event_response_model.dart';
import 'package:moomalpublication/features/event_press_release/data/services/event_service.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class EventPressController extends BaseController {
  final Rx<EventsResponse> eventResponse = Rx(EventsResponse());

  final List<EventsResponseModel> events = [];

  List<String> years = ["2016", "2017", "2018", "2019"];
  int intialYear = 0;
  RxList<Map<String, dynamic>> yearList = RxList();

  @override
  void onInit() {
    super.onInit();
    generateYearList();
    _getEvents();
  }

  void navigateSettingDetailScreen({required String appBarTitle}) {
    AppRouting.toNamed(NameRoutes.detailEventScreen, argument: [
      {"appBarTitle": appBarTitle}
    ]);
  }

  Future<void> _getEvents() async {
    eventResponse.value = ApiResponse.loading();
    eventResponse.value =
        await EventService.getEvents(query: {'year': years[intialYear]});

    if (eventResponse.value.data != null) {
      events.clear();
      events.addAll(eventResponse.value.data!);
    } else {
      showSnackBar(AppConstants.somethingWentWrong);
    }
  }

  void generateYearList() {
    yearList = RxList.generate(
      years.length,
      (index) => {'year': years[index], 'hasEvent': false},
    );
    yearList[intialYear]["hasEvent"] = !yearList[intialYear]["hasEvent"];
    onYearClick(currentYear: 0);
  }

  void onYearClick({required int currentYear}) {
    if (intialYear != currentYear) {
      yearList[currentYear]["hasEvent"] = !yearList[currentYear]["hasEvent"];
      yearList[intialYear]["hasEvent"] = !yearList[intialYear]["hasEvent"];
      intialYear = currentYear;
      _getEvents();
      yearList.refresh();
    }
  }
}


