import 'package:moomalpublication/features/event_press_release/data/models/event_response_model.dart';
import 'package:moomalpublication/features/event_press_release/data/models/press_event_response_model.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

typedef EventsResponse = ApiResponse<List<EventsResponseModel>>;
typedef PressReleaseResponse = ApiResponse<List<PressEventResponseModel>>;
