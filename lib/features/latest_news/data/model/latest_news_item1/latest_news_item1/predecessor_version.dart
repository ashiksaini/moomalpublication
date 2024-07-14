class PredecessorVersion {
  int? id;
  String? href;

  PredecessorVersion({this.id, this.href});

  factory PredecessorVersion.fromJson(Map<String, dynamic> json) {
    return PredecessorVersion(
      id: json['id'] as int?,
      href: json['href'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'href': href,
      };
}
