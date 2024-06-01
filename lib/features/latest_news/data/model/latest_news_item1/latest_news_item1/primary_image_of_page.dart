class PrimaryImageOfPage {
  String? id;

  PrimaryImageOfPage({this.id});

  factory PrimaryImageOfPage.fromJson(Map<String, dynamic> json) {
    return PrimaryImageOfPage(
      id: json['@id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        '@id': id,
      };
}
