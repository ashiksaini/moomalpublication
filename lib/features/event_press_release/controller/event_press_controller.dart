import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/event_press_release/data/constants/type_alias.dart';
import 'package:moomalpublication/features/event_press_release/data/models/event_response_model.dart';
import 'package:moomalpublication/features/event_press_release/data/models/press_event_response_model.dart';
import 'package:moomalpublication/features/event_press_release/data/models/year_model.dart';
import 'package:moomalpublication/features/event_press_release/data/services/event_service.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class EventPressController extends BaseController {
  final Rx<EventsResponse> eventResponse = Rx(EventsResponse());
  final Rx<PressReleaseResponse> pressReleaseResponse =
      Rx(PressReleaseResponse());

  final RxList<EventsResponseModel> events = RxList<EventsResponseModel>();
  final RxList<PressEventResponseModel> pressReleaseList =
      RxList<PressEventResponseModel>();

  RxList<Year> yearListData = RxList();

  int intialYear = 0;
  int numberOfYear = 5;

  @override
  void onInit() {
    super.onInit();
    generateYearList();
    _getEvents();
    _getPressRelease();
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

  Future<void> _getPressRelease() async {
    pressReleaseResponse.value = ApiResponse.loading();
    pressReleaseResponse.value = await EventService.getPressRelease(
        query: {'year': yearListData[intialYear].year});

    if (pressReleaseResponse.value.data != null) {
      pressReleaseList.clear();
      pressReleaseList.addAll(pressReleaseResponse.value.data!);
    } else {
      showSnackBar(AppConstants.somethingWentWrong);
    }
  }

  void generateYearList() {
    final currentYear = DateTime.now().year;
    yearListData.addAll(List.generate(
      numberOfYear,
      (index) => Year(index: index, year: currentYear - index, clicked: false),
    ));

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
      _getPressRelease();
      yearListData.refresh();
    }
  }
}
