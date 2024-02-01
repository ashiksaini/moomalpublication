import 'attributes.dart';

class Variation {
  int? id;
  Attributes? attributes;
  String? price;
  String? regularPrice;
  String? salePrice;
  String? stockStatus;

  Variation({
    this.id,
    this.attributes,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.stockStatus,
  });

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
        id: json['id'] as int?,
        attributes: json['attributes'] == null
            ? null
            : Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
        price: json['price'] as String?,
        regularPrice: json['regular_price'] as String?,
        salePrice: json['sale_price'] as String?,
        stockStatus: json['stock_status'] as String?,
      );
}
