import 'package:moomalpublication/config/api_keys.dart';

class ProductRequestData {
  int? category;
  String? orderBy;
  String? order;
  int? perPage;
  int? page;
  String? stockStatus;
  String? consumerKey;
  String? consumerSecret;

  ProductRequestData({
    this.category,
    this.orderBy,
    this.order,
    this.page,
    this.perPage,
    this.stockStatus,
    this.consumerKey,
    this.consumerSecret,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (category != null) data.putIfAbsent('category', () => category);
    if (orderBy != null) data.putIfAbsent('orderby', () => orderBy);
    if (order != null) data.putIfAbsent('order', () => order);
    if (perPage != null) data.putIfAbsent('per_page', () => perPage);
    if (page != null) data.putIfAbsent('page', () => page);
    if (stockStatus != null) data.putIfAbsent('stock_status', () => stockStatus);
    data.putIfAbsent('consumer_key', () => ApiKeys.productConsumerKey);
    data.putIfAbsent('consumer_secret', () => ApiKeys.productConsumerSecret);

    return data;
  }
}
