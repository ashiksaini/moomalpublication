import 'raw_prices.dart';

class Prices {
  String? price;
  String? regularPrice;
  String? salePrice;
  dynamic priceRange;
  String? currencyCode;
  String? currencySymbol;
  int? currencyMinorUnit;
  String? currencyDecimalSeparator;
  String? currencyThousandSeparator;
  String? currencyPrefix;
  String? currencySuffix;
  RawPrices? rawPrices;

  Prices({
    this.price,
    this.regularPrice,
    this.salePrice,
    this.priceRange,
    this.currencyCode,
    this.currencySymbol,
    this.currencyMinorUnit,
    this.currencyDecimalSeparator,
    this.currencyThousandSeparator,
    this.currencyPrefix,
    this.currencySuffix,
    this.rawPrices,
  });

  factory Prices.fromJson(Map<String, dynamic> json) => Prices(
        price: json['price'] as String?,
        regularPrice: json['regular_price'] as String?,
        salePrice: json['sale_price'] as String?,
        priceRange: json['price_range'] as dynamic,
        currencyCode: json['currency_code'] as String?,
        currencySymbol: json['currency_symbol'] as String?,
        currencyMinorUnit: json['currency_minor_unit'] as int?,
        currencyDecimalSeparator: json['currency_decimal_separator'] as String?,
        currencyThousandSeparator:
            json['currency_thousand_separator'] as String?,
        currencyPrefix: json['currency_prefix'] as String?,
        currencySuffix: json['currency_suffix'] as String?,
        rawPrices: json['raw_prices'] == null
            ? null
            : RawPrices.fromJson(json['raw_prices'] as Map<String, dynamic>),
      );
}
