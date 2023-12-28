import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/event_press_release/data/constants/type_alias.dart';
import 'package:moomalpublication/features/event_press_release/data/models/event_response_model.dart';
import 'package:moomalpublication/features/event_press_release/data/models/year_model.dart';
import 'package:moomalpublication/features/event_press_release/data/services/event_service.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class EventPressController extends BaseController {
  final Rx<EventsResponse> eventResponse = Rx(EventsResponse());

  final List<EventsResponseModel> events = [];
  RxList<Year> yearListData = RxList();

  int intialYear = 0;

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
    eventResponse.value = await EventService.getEvents(
        query: {'year': yearListData[intialYear].year});

    if (eventResponse.value.data != null) {
      events.clear();
      events.addAll(eventResponse.value.data!);
    } else {
      showSnackBar(AppConstants.somethingWentWrong);
    }
  }

  void generateYearList() {
    yearListData.value = [
      Year(index: 0, year: 2016, clicked: false),
      Year(index: 1, year: 2017, clicked: false),
      Year(index: 2, year: 2018, clicked: false),
      Year(index: 3, year: 2019, clicked: false),
    ];
    if (yearListData.isNotEmpty) {
      intialYear = yearListData[0].index!;
      yearListData[0].clicked = true;
    }
  }

  void onYearClick({required int currentYear}) {
    if (intialYear != currentYear) {
      yearListData[currentYear].clicked = !yearListData[currentYear].clicked!;
      yearListData[intialYear].clicked = !yearListData[intialYear].clicked!;
      intialYear = currentYear;
      _getEvents();
      yearListData.refresh();
    }
  }
}
