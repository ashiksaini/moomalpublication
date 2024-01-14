class OrderResponseModel {
  final DateTime? datePaid;
  final List<LineItem>? lineItems;

  OrderResponseModel({this.datePaid, this.lineItems});
  factory OrderResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderResponseModel(
        datePaid: json["date_paid"] == null
            ? null
            : DateTime.parse(json["date_paid"]),
        lineItems: json["line_items"] == null
            ? []
            : List<LineItem>.from(
                json["line_items"]!.map((x) => LineItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date_paid": datePaid?.toIso8601String(),
        "line_items": lineItems == null
            ? []
            : List<dynamic>.from(lineItems!.map((x) => x.toJson())),
      };
}

class LineItem {
  final int? id;
  final String? name;
  final int? price;
  final Image? image;

  LineItem({
    this.id,
    this.name,
    this.price,
    this.image,
  });

  factory LineItem.fromJson(Map<String, dynamic> json) => LineItem(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "image": image?.toJson(),
      };
}

class Image {
  final String? src;

  Image({
    this.src,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        src: json["src"],
      );

  Map<String, dynamic> toJson() => {
        "src": src,
      };
}
