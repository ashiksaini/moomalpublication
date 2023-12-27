class AddToCartReqData {
  String? id;
  String? quantity;
  String? key;

  AddToCartReqData({
    this.id,
    this.quantity,
    this.key,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data.putIfAbsent('id', () => id);
    data.putIfAbsent('quantity', () => quantity);
    data.putIfAbsent('key', () => key);
    return data;
  }
}
