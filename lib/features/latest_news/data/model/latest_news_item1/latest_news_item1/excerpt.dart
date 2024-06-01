class Excerpt {
  String? rendered;
  bool? protected;

  Excerpt({this.rendered, this.protected});

  factory Excerpt.fromJson(Map<String, dynamic> json) => Excerpt(
        rendered: json['rendered'] as String?,
        protected: json['protected'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'rendered': rendered,
        'protected': protected,
      };
}
