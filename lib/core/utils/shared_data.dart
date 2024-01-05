import 'package:moomalpublication/core/base/product_item/product_item.dart';
import 'package:moomalpublication/routes/name_routes.dart';

class SharedData {
  ProductItem? productItem;
  String? categoryWiseAppBarTitle;
  int? categoryId;
  String backStackRoute;

  SharedData({
    this.productItem,
    this.categoryWiseAppBarTitle,
    this.categoryId,
    this.backStackRoute = NameRoutes.moomalpublicationApp,
  });
}
