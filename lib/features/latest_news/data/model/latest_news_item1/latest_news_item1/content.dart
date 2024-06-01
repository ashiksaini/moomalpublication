class Content {
  String? rendered;
  bool? protected;

  Content({this.rendered, this.protected});

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json['rendered'] as String?,
        protected: json['protected'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'rendered': rendered,
        'protected': protected,
      };
}
