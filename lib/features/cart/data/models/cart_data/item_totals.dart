class ItemTotals {
  String? lineSubtotal;
  String? lineSubtotalTax;
  String? lineTotal;
  String? lineTotalTax;
  String? currencyCode;
  String? currencySymbol;
  int? currencyMinorUnit;
  String? currencyDecimalSeparator;
  String? currencyThousandSeparator;
  String? currencyPrefix;
  String? currencySuffix;

  ItemTotals({
    this.lineSubtotal,
    this.lineSubtotalTax,
    this.lineTotal,
    this.lineTotalTax,
    this.currencyCode,
    this.currencySymbol,
    this.currencyMinorUnit,
    this.currencyDecimalSeparator,
    this.currencyThousandSeparator,
    this.currencyPrefix,
    this.currencySuffix,
  });

  factory ItemTotals.fromJson(Map<String, dynamic> json) => ItemTotals(
        lineSubtotal: json['line_subtotal'] as String?,
        lineSubtotalTax: json['line_subtotal_tax'] as String?,
        lineTotal: json['line_total'] as String?,
        lineTotalTax: json['line_total_tax'] as String?,
        currencyCode: json['currency_code'] as String?,
        currencySymbol: json['currency_symbol'] as String?,
        currencyMinorUnit: json['currency_minor_unit'] as int?,
        currencyDecimalSeparator: json['currency_decimal_separator'] as String?,
        currencyThousandSeparator:
            json['currency_thousand_separator'] as String?,
        currencyPrefix: json['currency_prefix'] as String?,
        currencySuffix: json['currency_suffix'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'line_subtotal': lineSubtotal,
        'line_subtotal_tax': lineSubtotalTax,
        'line_total': lineTotal,
        'line_total_tax': lineTotalTax,
        'currency_code': currencyCode,
        'currency_symbol': currencySymbol,
        'currency_minor_unit': currencyMinorUnit,
        'currency_decimal_separator': currencyDecimalSeparator,
        'currency_thousand_separator': currencyThousandSeparator,
        'currency_prefix': currencyPrefix,
        'currency_suffix': currencySuffix,
      };
}
