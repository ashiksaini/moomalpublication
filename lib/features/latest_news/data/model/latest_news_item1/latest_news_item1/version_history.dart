class VersionHistory {
  int? count;
  String? href;

  VersionHistory({this.count, this.href});

  factory VersionHistory.fromJson(Map<String, dynamic> json) {
    return VersionHistory(
      count: json['count'] as int?,
      href: json['href'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'count': count,
        'href': href,
      };
}
