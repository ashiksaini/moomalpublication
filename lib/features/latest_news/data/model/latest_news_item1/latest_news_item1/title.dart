class Title {
  String? rendered;

  Title({this.rendered});

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        rendered: json['rendered'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'rendered': rendered,
      };
}
