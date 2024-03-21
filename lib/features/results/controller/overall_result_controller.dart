import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/features/results/data/constants/type_alias.dart';
import 'package:moomalpublication/features/results/data/models/result.dart';
import 'package:moomalpublication/features/results/data/services/result_services.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class OverallResultController extends BaseController {
  Rx<OverallResultResponse> overallResultResponse = Rx(ApiResponse());
  RxList<Result> overallPerformance = RxList();
  bool isOverallResult = false;

  OverallResultController(this.isOverallResult);

  @override
  void onInit() {
    super.onInit();

    if (isOverallResult) {
      _getOverallResults();
    }
  }

  void _getOverallResults() async {
    overallResultResponse.value = ApiResponse.loading();
    overallResultResponse.value = await ResultServices.getOverallResult();

    if (overallResultResponse.value.data != null) {
      overallPerformance.addAll(overallResultResponse.value.data ?? []);
    }
  }
}
