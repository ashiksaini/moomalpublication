class WpAttachment {
  String? href;

  WpAttachment({this.href});

  factory WpAttachment.fromJson(Map<String, dynamic> json) => WpAttachment(
        href: json['href'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'href': href,
      };
}
