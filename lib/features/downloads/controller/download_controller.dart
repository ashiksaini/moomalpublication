import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/downloads/data/constants/type_alias.dart';
import 'package:moomalpublication/features/downloads/data/model/download_response_model/download_response_model.dart';
import 'package:moomalpublication/features/downloads/data/services/download_services.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class DownloadController extends BaseController {
  final Rx<DownloadResponse> downloadSeriesResponse = Rx(DownloadResponse());

  RxList<DownloadResponseModel> downloadList = RxList();

  @override
  void onInit() {
    super.onInit();
    _getTestDownload(userid: 1);
  }

  Future<void> _getTestDownload({
    required int userid,
  }) async {
    downloadSeriesResponse.value = ApiResponse.loading();
    downloadSeriesResponse.value =
        await DownloadService.getDownloadList(query: {'user_id': userid});

    if (downloadSeriesResponse.value.data != null) {
      downloadList.clear();
      downloadList.addAll(downloadSeriesResponse.value.data!);
    } else {
      showSnackBar(AppConstants.somethingWentWrong);
    }
  }
}
