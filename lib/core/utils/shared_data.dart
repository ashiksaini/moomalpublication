import 'package:moomalpublication/core/base/product_item/product_item.dart';
import 'package:moomalpublication/routes/name_routes.dart';

class SharedData {
  ProductItem? productItem;
  String? categoryWiseAppBarTitle;
  int? categoryId;
  String backStackRoute;

  String? productName;
  String? productURL;

  SharedData({
    this.productItem,
    this.categoryWiseAppBarTitle,
    this.categoryId,
    this.backStackRoute = NameRoutes.moomalpublicationApp,

    this.productName,
    this.productURL,
  });
}
