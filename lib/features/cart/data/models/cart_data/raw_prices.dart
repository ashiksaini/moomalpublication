class RawPrices {
  int? precision;
  String? price;
  String? regularPrice;
  String? salePrice;

  RawPrices({
    this.precision,
    this.price,
    this.regularPrice,
    this.salePrice,
  });

  factory RawPrices.fromJson(Map<String, dynamic> json) => RawPrices(
        precision: json['precision'] as int?,
        price: json['price'] as String?,
        regularPrice: json['regular_price'] as String?,
        salePrice: json['sale_price'] as String?,
      );
}
