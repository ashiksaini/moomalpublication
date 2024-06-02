import 'image.dart';
import 'meta_datum.dart';

class LineItem {
  int? id;
  String? name;
  int? productId;
  int? variationId;
  int? quantity;
  String? taxClass;
  String? subtotal;
  String? subtotalTax;
  String? total;
  String? totalTax;
  List<dynamic>? taxes;
  List<MetaDatum>? metaData;
  String? sku;
  int? price;
  Image? image;
  String? parentName;

  LineItem({
    this.id,
    this.name,
    this.productId,
    this.variationId,
    this.quantity,
    this.taxClass,
    this.subtotal,
    this.subtotalTax,
    this.total,
    this.totalTax,
    this.taxes,
    this.metaData,
    this.sku,
    this.price,
    this.image,
    this.parentName,
  });

  factory LineItem.fromJson(Map<String, dynamic> json) => LineItem(
        id: json['id'] as int?,
        name: json['name'] as String?,
        productId: json['product_id'] as int?,
        variationId: json['variation_id'] as int?,
        quantity: json['quantity'] as int?,
        taxClass: json['tax_class'] as String?,
        subtotal: json['subtotal'] as String?,
        subtotalTax: json['subtotal_tax'] as String?,
        total: json['total'] as String?,
        totalTax: json['total_tax'] as String?,
        taxes: json['taxes'] as List<dynamic>?,
        metaData: (json['meta_data'] as List<dynamic>?)
            ?.map((e) => MetaDatum.fromJson(e as Map<String, dynamic>))
            .toList(),
        sku: json['sku'] as String?,
        price: json['price'] as int?,
        image: json['image'] == null
            ? null
            : Image.fromJson(json['image'] as Map<String, dynamic>),
        parentName: json['parent_name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'product_id': productId,
        'variation_id': variationId,
        'quantity': quantity,
        'tax_class': taxClass,
        'subtotal': subtotal,
        'subtotal_tax': subtotalTax,
        'total': total,
        'total_tax': totalTax,
        'taxes': taxes,
        'meta_data': metaData?.map((e) => e.toJson()).toList(),
        'sku': sku,
        'price': price,
        'image': image?.toJson(),
        'parent_name': parentName,
      };
}
