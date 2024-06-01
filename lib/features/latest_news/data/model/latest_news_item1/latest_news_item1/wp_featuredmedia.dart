class WpFeaturedmedia {
  bool? embeddable;
  String? href;

  WpFeaturedmedia({this.embeddable, this.href});

  factory WpFeaturedmedia.fromJson(Map<String, dynamic> json) {
    return WpFeaturedmedia(
      embeddable: json['embeddable'] as bool?,
      href: json['href'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'embeddable': embeddable,
        'href': href,
      };
}
