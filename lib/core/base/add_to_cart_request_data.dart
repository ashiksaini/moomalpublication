class AddToCartReqData {
  String? id;
  String? quantity;

  AddToCartReqData({
    this.id,
    this.quantity,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data.putIfAbsent('id', () => id);
    data.putIfAbsent('quantity', () => quantity);
    return data;
  }
}
