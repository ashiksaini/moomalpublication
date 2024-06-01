import 'og_image.dart';
import 'robots.dart';
import 'schema.dart';
import 'twitter_misc.dart';

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
  String? articlePublishedTime;
  String? articleModifiedTime;
  List<OgImage>? ogImage;
  String? author;
  String? twitterCard;
  TwitterMisc? twitterMisc;
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
    this.articlePublishedTime,
    this.articleModifiedTime,
    this.ogImage,
    this.author,
    this.twitterCard,
    this.twitterMisc,
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
        articlePublishedTime: json['article_published_time'] as String?,
        articleModifiedTime: json['article_modified_time'] as String?,
        ogImage: (json['og_image'] as List<dynamic>?)
            ?.map((e) => OgImage.fromJson(e as Map<String, dynamic>))
            .toList(),
        author: json['author'] as String?,
        twitterCard: json['twitter_card'] as String?,
        twitterMisc: json['twitter_misc'] == null
            ? null
            : TwitterMisc.fromJson(
                json['twitter_misc'] as Map<String, dynamic>),
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
        'og_description': ogDescription,
        'og_url': ogUrl,
        'og_site_name': ogSiteName,
        'article_published_time': articlePublishedTime,
        'article_modified_time': articleModifiedTime,
        'og_image': ogImage?.map((e) => e.toJson()).toList(),
        'author': author,
        'twitter_card': twitterCard,
        'twitter_misc': twitterMisc?.toJson(),
        'schema': schema?.toJson(),
      };
}
