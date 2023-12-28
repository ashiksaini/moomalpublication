import 'package:moomalpublication/features/test_series/data/models/test_series_list_response_model.dart';
import 'package:moomalpublication/features/test_series/data/models/test_series_response_model.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

typedef TestSeriesResponse = ApiResponse<List<TestSeriesResponseModel>>;
typedef TestSeriesListResponse = ApiResponse<List<TestSeriesListResponseModel>>;
