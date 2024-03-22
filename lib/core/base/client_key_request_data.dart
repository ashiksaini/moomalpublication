class ClientKeyRequestData {
  String? clientKey;
  String? clientSecret;

  ClientKeyRequestData({
    this.clientKey,
    this.clientSecret,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (clientKey != null) {
      data.putIfAbsent('client_key', () => clientKey);
    }
    if (clientSecret != null) {
      data.putIfAbsent('client_secret', () => clientSecret);
    }
    return data;
  }
}
