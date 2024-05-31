class Variation {
  String? attribute;
  String? value;

  Variation({
    this.attribute,
    this.value,
  });

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
        attribute: json['attribute'] as String?,
        value: json['value'] as String?,
      );
}
