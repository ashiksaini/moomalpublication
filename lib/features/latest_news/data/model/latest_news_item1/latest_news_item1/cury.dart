class Cury {
  String? name;
  String? href;
  bool? templated;

  Cury({this.name, this.href, this.templated});

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: json['name'] as String?,
        href: json['href'] as String?,
        templated: json['templated'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'href': href,
        'templated': templated,
      };
}
