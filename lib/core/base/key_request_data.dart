class KeyRequestData {
  String? consumerKey;
  String? consumerSecret;

  KeyRequestData({
    this.consumerKey,
    this.consumerSecret,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (consumerKey != null) data.putIfAbsent('consumer_key', () => consumerKey);
    if (consumerSecret != null) data.putIfAbsent('consumer_secret', () => consumerSecret);
    return data;
  }
}
