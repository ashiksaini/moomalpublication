class Attributes {
  String? attributePurchase;

  Attributes({this.attributePurchase});

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        attributePurchase: json['attribute_purchase'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'attribute_purchase': attributePurchase,
      };
}
