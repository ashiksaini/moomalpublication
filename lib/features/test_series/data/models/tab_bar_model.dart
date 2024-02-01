import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:moomalpublication/features/test_series/data/models/test_series_response_model.dart';

class TabBarModel {
  final String? tabName;
  final int? tabId;
  RxList<TestSeriesResponseModel>? testList;

  TabBarModel({
    required this.tabName,
    required this.tabId,
    required this.testList,
  });

  factory TabBarModel.fromJson(Map<String, dynamic> json) => TabBarModel(
        tabName: json["tabName"] as String?,
        tabId: json["tabId"] as int?,
        testList: RxList<TestSeriesResponseModel>.of(
          (json["testList"] as List<dynamic>? ?? [])
              .map((x) => TestSeriesResponseModel.fromJson(x)),
        ),
      );
}
