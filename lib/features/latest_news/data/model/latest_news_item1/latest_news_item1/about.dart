class About {
  String? href;

  About({this.href});

  factory About.fromJson(Map<String, dynamic> json) => About(
        href: json['href'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'href': href,
      };
}
