class WpTerm {
  String? taxonomy;
  bool? embeddable;
  String? href;

  WpTerm({this.taxonomy, this.embeddable, this.href});

  factory WpTerm.fromJson(Map<String, dynamic> json) => WpTerm(
        taxonomy: json['taxonomy'] as String?,
        embeddable: json['embeddable'] as bool?,
        href: json['href'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'taxonomy': taxonomy,
        'embeddable': embeddable,
        'href': href,
      };
}
