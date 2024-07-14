class Guid {
  String? rendered;

  Guid({this.rendered});

  factory Guid.fromJson(Map<String, dynamic> json) => Guid(
        rendered: json['rendered'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'rendered': rendered,
      };
}
