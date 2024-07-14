class Meta {
  String? footnotes;

  Meta({this.footnotes});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        footnotes: json['footnotes'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'footnotes': footnotes,
      };
}
