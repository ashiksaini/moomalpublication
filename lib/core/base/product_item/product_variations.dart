import 'attribute.dart';

class ProductVariations {
  String? id;
  bool? onSale;
  String? regularPrice;
  String? salePrice;
  String? sku;
  String? quantity;
  dynamic stock;
  String? stockStatus;
  List<Attribute>? attributes;

  ProductVariations({
    this.id,
    this.onSale,
    this.regularPrice,
    this.salePrice,
    this.sku,
    this.quantity,
    this.stock,
    this.stockStatus,
    this.attributes,
  });

  factory ProductVariations.fromJson(Map<String, dynamic> json) {
    return ProductVariations(
      id: json['id'].toString(),
      onSale: json['on_sale'] as bool?,
      regularPrice: json['regular_price'].toString(),
      salePrice: json['sale_price'].toString(),
      sku: json['sku'] as String?,
      quantity: json['quantity'] as String?,
      stock: json['stock'] as dynamic,
      stockStatus: json['stock_status'] as String?,
      attributes: (json['attributes'] as List<dynamic>?)
          ?.map((e) => Attribute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'on_sale': onSale,
        'regular_price': regularPrice,
        'sale_price': salePrice,
        'sku': sku,
        'quantity': quantity,
        'stock': stock,
        'stock_status': stockStatus,
        'attributes': attributes?.map((e) => e.toJson()).toList(),
      };
}
