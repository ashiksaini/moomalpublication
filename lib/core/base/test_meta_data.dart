class KeyValueData {
  String? key;
  String? value;

  KeyValueData({
    this.key,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (key != null) data.putIfAbsent('key', () => key);
    if (value != null) data.putIfAbsent('value', () => value);
    return data;
  }
}
