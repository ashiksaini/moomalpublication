class OrderDetail {
  String? productName;
  String? productLink;
  String? variantName;
  int? variantId;
  String? subtotal;

  OrderDetail({
    this.productName,
    this.productLink,
    this.variantName,
    this.variantId,
    this.subtotal,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        productName: json['product_name'] as String?,
        productLink: json['product_link'] as String?,
        variantName: json['variant_name'] as String?,
        variantId: json['variant_id'] as int?,
        subtotal: json['subtotal'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'product_name': productName,
        'product_link': productLink,
        'variant_name': variantName,
        'variant_id': variantId,
        'subtotal': subtotal,
      };
}
