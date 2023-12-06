class ProductDetailRequestData {
  String? consumerKey;
  String? consumerSecret;

  ProductDetailRequestData({
    this.consumerKey,
    this.consumerSecret,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data.putIfAbsent('consumer_key', () => consumerKey);
    data.putIfAbsent('consumer_secret', () => consumerSecret);

    return data;
  }
}
