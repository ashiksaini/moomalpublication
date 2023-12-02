class ItemListElement {
  String? type;
  int? position;
  String? name;
  String? item;

  ItemListElement({this.type, this.position, this.name, this.item});

  factory ItemListElement.fromJson(Map<String, dynamic> json) {
    return ItemListElement(
      type: json['@type'] as String?,
      position: json['position'] as int?,
      name: json['name'] as String?,
      item: json['item'] as String?,
    );
  }

  Map<String, dynamic> toFrom() => {
        '@type': type,
        'position': position,
        'name': name,
        'item': item,
      };
}
