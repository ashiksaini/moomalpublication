class ProductRequestData {
  int? category;
  String? orderBy;
  String? order;
  int? perPage;
  int? page;
  String? consumerKey;
  String? consumerSecret;

  ProductRequestData({
    this.category,
    this.orderBy,
    this.order,
    this.page,
    this.perPage,
    this.consumerKey,
    this.consumerSecret,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (category != null) data.putIfAbsent('category', () => category);
    if (orderBy != null) data.putIfAbsent('orderBy', () => orderBy);
    if (order != null) data.putIfAbsent('order', () => order);
    if (perPage != null) data.putIfAbsent('per_page', () => perPage);
    if (page != null) data.putIfAbsent('page', () => page);
    data.putIfAbsent(
        'consumer_key', () => "ck_0d68ec5d46979420eb3fe93eb254632ccf34a8d4");
    data.putIfAbsent(
        'consumer_secret', () => "cs_e2959e16b6e59b584f94b97fa8a731f8d562962c");

    return data;
  }
}
