class KeyRequestData {
  String consumerKey;
  String consumerSecret;

  KeyRequestData({
    required this.consumerKey,
    required this.consumerSecret,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data.putIfAbsent('consumer_key', () => consumerKey);
    data.putIfAbsent('consumer_secret', () => consumerSecret);
    return data;
  }
}
