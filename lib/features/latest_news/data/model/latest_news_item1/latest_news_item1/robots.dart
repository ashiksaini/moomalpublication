class Robots {
  String? index;
  String? follow;
  String? maxSnippet;
  String? maxImagePreview;
  String? maxVideoPreview;

  Robots({
    this.index,
    this.follow,
    this.maxSnippet,
    this.maxImagePreview,
    this.maxVideoPreview,
  });

  factory Robots.fromJson(Map<String, dynamic> json) => Robots(
        index: json['index'] as String?,
        follow: json['follow'] as String?,
        maxSnippet: json['max-snippet'] as String?,
        maxImagePreview: json['max-image-preview'] as String?,
        maxVideoPreview: json['max-video-preview'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'index': index,
        'follow': follow,
        'max-snippet': maxSnippet,
        'max-image-preview': maxImagePreview,
        'max-video-preview': maxVideoPreview,
      };
}
