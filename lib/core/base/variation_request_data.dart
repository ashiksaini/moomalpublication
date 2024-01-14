class VariationRequestData {
  String? attribute;
  String? value;

  VariationRequestData({
    this.attribute,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (attribute != null) data.putIfAbsent('attribute', () => attribute);
    if (value != null) data.putIfAbsent('value', () => value);
    return data;
  }
}
