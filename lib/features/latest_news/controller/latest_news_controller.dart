import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/features/latest_news/data/constants/type_alias.dart';
import 'package:moomalpublication/features/latest_news/data/model/latest_news_item/latest_news_item.dart';
import 'package:moomalpublication/features/latest_news/data/services/latest_news_services.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class LatestNewsController extends BaseController {
  Rx<LatestNewsResponse> latestNewsResponse = Rx(ApiResponse());
  RxList<LatestNewsItem> latestNews = RxList();
  LatestNewsItem latestNewsItem = LatestNewsItem();

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

  void navigateNewsDetailScreen({required int index}) {
    latestNewsItem = latestNews[index];
    AppRouting.toNamed(NameRoutes.newsDetailScreen, argument: [
      {"index": index}
    ]);
  }

  void _getNewsDetail() {}
}
