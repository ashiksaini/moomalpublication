class Reply {
  bool? embeddable;
  String? href;

  Reply({this.embeddable, this.href});

  factory Reply.fromJson(Map<String, dynamic> json) => Reply(
        embeddable: json['embeddable'] as bool?,
        href: json['href'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'embeddable': embeddable,
        'href': href,
      };
}
