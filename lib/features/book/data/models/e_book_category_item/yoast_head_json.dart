import 'robots.dart';
import 'schema.dart';

class YoastHeadJson {
  String? title;
  Robots? robots;
  String? canonical;
  String? ogLocale;
  String? ogType;
  String? ogTitle;
  String? ogUrl;
  String? ogSiteName;
  String? twitterCard;
  Schema? schema;

  YoastHeadJson({
    this.title,
    this.robots,
    this.canonical,
    this.ogLocale,
    this.ogType,
    this.ogTitle,
    this.ogUrl,
    this.ogSiteName,
    this.twitterCard,
    this.schema,
  });

  factory YoastHeadJson.fromJson(Map<String, dynamic> json) => YoastHeadJson(
        title: json['title'] as String?,
        robots: json['robots'] == null
            ? null
            : Robots.fromJson(json['robots'] as Map<String, dynamic>),
        canonical: json['canonical'] as String?,
        ogLocale: json['og_locale'] as String?,
        ogType: json['og_type'] as String?,
        ogTitle: json['og_title'] as String?,
        ogUrl: json['og_url'] as String?,
        ogSiteName: json['og_site_name'] as String?,
        twitterCard: json['twitter_card'] as String?,
        schema: json['schema'] == null
            ? null
            : Schema.fromJson(json['schema'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'robots': robots?.toJson(),
        'canonical': canonical,
        'og_locale': ogLocale,
        'og_type': ogType,
        'og_title': ogTitle,
        'og_url': ogUrl,
        'og_site_name': ogSiteName,
        'twitter_card': twitterCard,
        'schema': schema?.toJson(),
      };
}
