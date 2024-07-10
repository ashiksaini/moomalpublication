import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/enums.dart';
import 'package:moomalpublication/core/utils/shared_data.dart';
import 'package:moomalpublication/features/latest_news/data/constants/type_alias.dart';
import 'package:moomalpublication/features/latest_news/data/model/latest_news_item1/latest_news_item1/latest_news_item1.dart';
import 'package:moomalpublication/features/latest_news/data/services/latest_news_services.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class LatestNewsController extends BaseController {
  late SharedData? sharedData;
  Rx<LatestNewsResponse> latestNewsResponse = Rx(ApiResponse());
  RxList<LatestNewsItem1> latestNews = RxList();
  LatestNewsItem1 latestNewsItem = LatestNewsItem1();
  RxString title = RxString("");

  @override
  void onInit() {
    super.onInit();

    sharedData = Get.arguments as SharedData?;

    title.value = sharedData?.type == Type.syllabus ? "syllabus".tr : sharedData?.type == Type.video ? "videos".tr  :"latest_news1".tr; 

    _getLatestNews();
  }

  Future<void> _getLatestNews() async {
    latestNewsResponse.value = ApiResponse.loading();
    latestNewsResponse.value = await LatestNewsServices.getLatestNews(queryParams: _getCategory());
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
  
  Map<String, String>? _getCategory() {
    return sharedData?.type == Type.syllabus ? { "categories": "74"}  : sharedData?.type == Type.video ? { "categories": "75"} : null;
  }
}
