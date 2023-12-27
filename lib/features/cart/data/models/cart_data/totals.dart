class Totals {
  String? totalItems;
  String? totalItemsTax;
  String? totalFees;
  String? totalFeesTax;
  String? totalDiscount;
  String? totalDiscountTax;
  String? totalShipping;
  String? totalShippingTax;
  String? totalPrice;
  String? totalTax;
  List<Map<String, dynamic>>? taxLines;
  String? currencyCode;
  String? currencySymbol;
  int? currencyMinorUnit;
  String? currencyDecimalSeparator;
  String? currencyThousandSeparator;
  String? currencyPrefix;
  String? currencySuffix;

  Totals({
    this.totalItems,
    this.totalItemsTax,
    this.totalFees,
    this.totalFeesTax,
    this.totalDiscount,
    this.totalDiscountTax,
    this.totalShipping,
    this.totalShippingTax,
    this.totalPrice,
    this.totalTax,
    this.taxLines,
    this.currencyCode,
    this.currencySymbol,
    this.currencyMinorUnit,
    this.currencyDecimalSeparator,
    this.currencyThousandSeparator,
    this.currencyPrefix,
    this.currencySuffix,
  });

  factory Totals.fromJson(Map<String, dynamic> json) => Totals(
        totalItems: json['total_items'] as String?,
        totalItemsTax: json['total_items_tax'] as String?,
        totalFees: json['total_fees'] as String?,
        totalFeesTax: json['total_fees_tax'] as String?,
        totalDiscount: json['total_discount'] as String?,
        totalDiscountTax: json['total_discount_tax'] as String?,
        totalShipping: json['total_shipping'] as String?,
        totalShippingTax: json['total_shipping_tax'] as String?,
        totalPrice: json['total_price'] as String?,
        totalTax: json['total_tax'] as String?,
        taxLines: (json['tax_lines'] as List<dynamic>?)
            ?.map((e) => e as Map<String, dynamic>)
            .toList(),
        currencyCode: json['currency_code'] as String?,
        currencySymbol: json['currency_symbol'] as String?,
        currencyMinorUnit: json['currency_minor_unit'] as int?,
        currencyDecimalSeparator: json['currency_decimal_separator'] as String?,
        currencyThousandSeparator:
            json['currency_thousand_separator'] as String?,
        currencyPrefix: json['currency_prefix'] as String?,
        currencySuffix: json['currency_suffix'] as String?,
      );
}
