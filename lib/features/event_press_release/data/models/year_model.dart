class Year {
  int? index;
  int? year;
  bool? clicked;

  Year({this.year, this.clicked = false, this.index});

  factory Year.fromJson(Map<String, dynamic> json) => Year(
        index: json['index'] as int?,
        year: json['year'] as int?,
        clicked: json['clicked'] as bool?,
      );
}
