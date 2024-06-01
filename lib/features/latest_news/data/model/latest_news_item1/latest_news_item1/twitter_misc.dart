class TwitterMisc {
  String? writtenBy;
  String? est;

  TwitterMisc({this.writtenBy, this.est});

  factory TwitterMisc.fromJson(Map<String, dynamic> json) => TwitterMisc(
        writtenBy: json['Written by'] as String?,
        est: json['Est. reading time'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Written by': writtenBy,
        'Est': est,
      };
}
