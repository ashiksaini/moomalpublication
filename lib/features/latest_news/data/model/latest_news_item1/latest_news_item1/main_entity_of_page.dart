class MainEntityOfPage {
  String? id;

  MainEntityOfPage({this.id});

  factory MainEntityOfPage.fromJson(Map<String, dynamic> json) {
    return MainEntityOfPage(
      id: json['@id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        '@id': id,
      };
}
