import 'package:moomalpublication/core/base/product_item/product_item.dart';

class SharedData {
  ProductItem? productItem;
  String? categoryWiseAppBarTitle;
  int? categoryId;

  SharedData({
    this.productItem,
    this.categoryWiseAppBarTitle,
    this.categoryId,
  });
}
