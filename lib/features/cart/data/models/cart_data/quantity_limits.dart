class QuantityLimits {
  int? minimum;
  int? maximum;
  int? multipleOf;
  bool? editable;

  QuantityLimits({
    this.minimum,
    this.maximum,
    this.multipleOf,
    this.editable,
  });

  factory QuantityLimits.fromJson(Map<String, dynamic> json) {
    return QuantityLimits(
      minimum: json['minimum'] as int?,
      maximum: json['maximum'] as int?,
      multipleOf: json['multiple_of'] as int?,
      editable: json['editable'] as bool?,
    );
  }
}
