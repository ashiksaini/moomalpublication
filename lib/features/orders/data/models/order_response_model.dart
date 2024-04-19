import 'package:moomalpublication/features/orders/data/models/shipping.dart';

class OrderResponseModel {
  final DateTime? datePaid;
  final List<LineItem>? lineItems;
  final Shipping? shippingData;

  OrderResponseModel({this.datePaid, this.lineItems, this.shippingData});
  factory OrderResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderResponseModel(
        datePaid: json["date_paid"] == null
            ? null
            : DateTime.parse(json["date_paid"]),
        shippingData: json['shipping'] == null
            ? null
            : Shipping.fromJson(json['shipping'] as Map<String, dynamic>),
        lineItems: json["line_items"] == null
            ? []
            : List<LineItem>.from(
                json["line_items"]!.map((x) => LineItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date_paid": datePaid?.toIso8601String(),
        "shipping": shippingData?.toJson(),
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
  String? dateCreated;
  final List<LineItemMetaData>? lineItemsMetaData;
  final int? quantity;
  final String? subtotal;
  final String? total;

  LineItem(
      {this.id,
      this.name,
      this.price,
      this.image,
      this.dateCreated,
      this.quantity,
      this.subtotal,
      this.total,
      this.lineItemsMetaData});

  factory LineItem.fromJson(Map<String, dynamic> json) => LineItem(
        id: json["id"] as int?,
        dateCreated: json['date_created'] as String?,
        subtotal: json['subtotal'] as String?,
        total: json['total'] as String?,
        quantity: json['quantity'] as int,
        name: json["name"]?.toString() ?? '',
        price: json["price"] as int?,
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        lineItemsMetaData: json["meta_data"] == null
            ? []
            : List<LineItemMetaData>.from(
                json["meta_data"]!.map((x) => LineItemMetaData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "image": image?.toJson(),
        "quantity": quantity,
        "subtotal": subtotal,
        "date_created": dateCreated,
        "line_items": lineItemsMetaData == null
            ? []
            : List<dynamic>.from(lineItemsMetaData!.map((x) => x.toJson())),
      };
}

class LineItemMetaData {
  String? displayValue;

  LineItemMetaData({
    this.displayValue,
  });

  factory LineItemMetaData.fromJson(Map<String, dynamic> json) =>
      LineItemMetaData(
        displayValue: json["display_value"]?.toString() ?? '',
      );

  Map<String, dynamic> toJson() => {
        "display_value": displayValue,
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
