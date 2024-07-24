import 'content.dart';
import 'title.dart';

class LatestNewsItem1 {
  int? id;
  // String? date;
  // String? dateGmt;
  // Guid? guid;
  // String? modified;
  // String? modifiedGmt;
  // String? slug;
  // String? status;
  // String? type;
  String? link;
  Title? title;
  Content? content;
  // Excerpt? excerpt;
  // int? author;
  // int? featuredMedia;
  // String? commentStatus;
  // String? pingStatus;
  // bool? sticky;
  // String? template;
  // String? format;
  // Meta? meta;
  // List<int>? categories;
  // List<dynamic>? tags;
  // String? yoastHead;
  // YoastHeadJson? yoastHeadJson;
  String? featuredImageUrl;
  // Links? links;

  LatestNewsItem1({
    this.title,
    this.content,
    this.featuredImageUrl,
    this.id,
    // this.id,
    // this.date,
    // this.dateGmt,
    // this.guid,
    // this.modified,
    // this.modifiedGmt,
    // this.slug,
    // this.status,
    // this.type,
    this.link,
    // this.excerpt,
    // this.author,
    // this.featuredMedia,
    // this.commentStatus,
    // this.pingStatus,
    // this.sticky,
    // this.template,
    // this.format,
    // this.meta,
    // this.categories,
    // this.tags,
    // this.yoastHead,
    // this.yoastHeadJson,
    // this.links,
  });

  factory LatestNewsItem1.fromJson(Map<String, dynamic> json) {
    String val = "";
    if (json['featured_image_url'] != null &&
        json['featured_image_url'] is String) {
      val = json['featured_image_url'];
    }

    return LatestNewsItem1(
      id: json['id'] as int?,
      title: json['title'] == null
          ? null
          : Title.fromJson(json['title'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : Content.fromJson(json['content'] as Map<String, dynamic>),
      featuredImageUrl: val,
      // date: json['date'] as String?,
      // dateGmt: json['date_gmt'] as String?,
      // guid: json['guid'] == null
      //     ? null
      //     : Guid.fromJson(json['guid'] as Map<String, dynamic>),
      // modified: json['modified'] as String?,
      // modifiedGmt: json['modified_gmt'] as String?,
      // slug: json['slug'] as String?,
      // status: json['status'] as String?,
      // type: json['type'] as String?,
      link: json['link'] as String?,
      // excerpt: json['excerpt'] == null
      //     ? null
      //     : Excerpt.fromJson(json['excerpt'] as Map<String, dynamic>),
      // author: json['author'] as int?,
      // featuredMedia: json['featured_media'] as int?,
      // commentStatus: json['comment_status'] as String?,
      // pingStatus: json['ping_status'] as String?,
      // sticky: json['sticky'] as bool?,
      // template: json['template'] as String?,
      // format: json['format'] as String?,
      // meta: json['meta'] == null
      //     ? null
      //     : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      // tags: json['tags'] as List<dynamic>?,
      // yoastHead: json['yoast_head'] as String?,
      // yoastHeadJson: json['yoast_head_json'] == null
      //     ? null
      //     : YoastHeadJson.fromJson(
      //         json['yoast_head_json'] as Map<String, dynamic>),
      // links: json['_links'] == null
      //     ? null
      //     : Links.fromJson(json['_links'] as Map<String, dynamic>),
    );
  }

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'date': date,
  //       'date_gmt': dateGmt,
  //       'guid': guid?.toJson(),
  //       'modified': modified,
  //       'modified_gmt': modifiedGmt,
  //       'slug': slug,
  //       'status': status,
  //       'type': type,
  //       'link': link,
  //       'title': title?.toJson(),
  //       'content': content?.toJson(),
  //       'excerpt': excerpt?.toJson(),
  //       'author': author,
  //       'featured_media': featuredMedia,
  //       'comment_status': commentStatus,
  //       'ping_status': pingStatus,
  //       'sticky': sticky,
  //       'template': template,
  //       'format': format,
  //       'meta': meta?.toJson(),
  //       'categories': categories,
  //       'tags': tags,
  //       'yoast_head': yoastHead,
  //       'yoast_head_json': yoastHeadJson?.toJson(),
  //       'featured_image_url': featuredImageUrl,
  //       '_links': links?.toJson(),
  //     };
}
