
import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/features/latest_news/data/constants/type_alias.dart';
import 'package:moomalpublication/features/latest_news/data/model/latest_news_item/latest_news_item.dart';
import 'package:moomalpublication/features/latest_news/data/services/latest_news_services.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class LatestNewsController extends BaseController {

  Rx<LatestNewsResponse> latestNewsResponse = Rx(ApiResponse());
  RxList<LatestNewsItem> latestNews = RxList();

  @override
  void onInit() {
    super.onInit();

    _getLatestNews();
  }
  
  Future<void> _getLatestNews() async {
    latestNewsResponse.value = ApiResponse.loading();
    latestNewsResponse.value = await LatestNewsServices.getLatestNews();

    if (latestNewsResponse.value.data != null) {
      if (latestNewsResponse.value.data!.isNotEmpty) {
        latestNews.addAll(latestNewsResponse.value.data ?? []);
      }
    }
  }
}