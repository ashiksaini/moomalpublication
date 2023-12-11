import 'og_image.dart';
import 'robots.dart';
import 'schema.dart';

class YoastHeadJson {
  String? title;
  Robots? robots;
  String? canonical;
  String? ogLocale;
  String? ogType;
  String? ogTitle;
  String? ogDescription;
  String? ogUrl;
  String? ogSiteName;
  String? articleModifiedTime;
  List<OgImage>? ogImage;
  String? twitterCard;
  Schema? schema;

  YoastHeadJson({
    this.title,
    this.robots,
    this.canonical,
    this.ogLocale,
    this.ogType,
    this.ogTitle,
    this.ogDescription,
    this.ogUrl,
    this.ogSiteName,
    this.articleModifiedTime,
    this.ogImage,
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
        ogDescription: json['og_description'] as String?,
        ogUrl: json['og_url'] as String?,
        ogSiteName: json['og_site_name'] as String?,
        articleModifiedTime: json['article_modified_time'] as String?,
        ogImage: (json['og_image'] as List<dynamic>?)
            ?.map((e) => OgImage.fromJson(e as Map<String, dynamic>))
            .toList(),
        twitterCard: json['twitter_card'] as String?,
        schema: json['schema'] == null
            ? null
            : Schema.fromJson(json['schema'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toFrom() => {
        'title': title,
        'robots': robots?.toFrom(),
        'canonical': canonical,
        'og_locale': ogLocale,
        'og_type': ogType,
        'og_title': ogTitle,
        'og_description': ogDescription,
        'og_url': ogUrl,
        'og_site_name': ogSiteName,
        'article_modified_time': articleModifiedTime,
        'og_image': ogImage?.map((e) => e.toFrom()).toList(),
        'twitter_card': twitterCard,
        'schema': schema?.toFrom(),
      };
}
