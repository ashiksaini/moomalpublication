import 'package:moomalpublication/core/base/product_item/product_item.dart';
import 'package:moomalpublication/core/constants/enums.dart';
import 'package:moomalpublication/features/test_series/data/models/test_series_response_model.dart';
import 'package:moomalpublication/routes/name_routes.dart';

class SharedData {
  ProductItem? productItem;
  String? categoryWiseAppBarTitle;
  int? categoryId;
  String backStackRoute;

  String? productName;
  String? productURL;

  String? testName;
  String? testUrl;
  TestSeriesResponseModel? testModel;

  Function? onCartCallBack;
  String? orderKey;
  String? orderId;
  String? totalPrice;

  ProductVariation? productVariations;
  Type? type;

  SharedData({
    this.productItem,
    this.categoryWiseAppBarTitle,
    this.categoryId,
    this.backStackRoute = NameRoutes.moomalpublicationApp,
    this.productName,
    this.productURL,
    this.testName,
    this.testUrl,
    this.testModel,
    this.onCartCallBack,
    this.orderId,
    this.orderKey,
    this.totalPrice,
    this.productVariations,
    this.type,
  });
}
