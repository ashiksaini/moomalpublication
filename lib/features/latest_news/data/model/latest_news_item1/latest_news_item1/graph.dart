import 'author.dart';
import 'breadcrumb.dart';
import 'image.dart';
import 'is_part_of.dart';
import 'item_list_element.dart';
import 'logo.dart';
import 'main_entity_of_page.dart';
import 'potential_action.dart';
import 'primary_image_of_page.dart';
import 'publisher.dart';

class Graph {
  String? type;
  String? id;
  IsPartOf? isPartOf;
  Author? author;
  String? headline;
  String? datePublished;
  String? dateModified;
  MainEntityOfPage? mainEntityOfPage;
  int? wordCount;
  int? commentCount;
  Publisher? publisher;
  Image? image;
  String? thumbnailUrl;
  List<String>? articleSection;
  String? inLanguage;
  List<PotentialAction>? potentialAction;
  String? url;
  String? name;
  PrimaryImageOfPage? primaryImageOfPage;
  Breadcrumb? breadcrumb;
  String? contentUrl;
  int? width;
  int? height;
  List<ItemListElement>? itemListElement;
  String? description;
  Logo? logo;
  List<String>? sameAs;

  Graph({
    this.type,
    this.id,
    this.isPartOf,
    this.author,
    this.headline,
    this.datePublished,
    this.dateModified,
    this.mainEntityOfPage,
    this.wordCount,
    this.commentCount,
    this.publisher,
    this.image,
    this.thumbnailUrl,
    this.articleSection,
    this.inLanguage,
    this.potentialAction,
    this.url,
    this.name,
    this.primaryImageOfPage,
    this.breadcrumb,
    this.contentUrl,
    this.width,
    this.height,
    this.itemListElement,
    this.description,
    this.logo,
    this.sameAs,
  });

  factory Graph.fromJson(Map<String, dynamic> json) => Graph(
        type: json['@type'] as String?,
        id: json['@id'] as String?,
        isPartOf: json['isPartOf'] == null
            ? null
            : IsPartOf.fromJson(json['isPartOf'] as Map<String, dynamic>),
        author: json['author'] == null
            ? null
            : Author.fromJson(json['author'] as Map<String, dynamic>),
        headline: json['headline'] as String?,
        datePublished: json['datePublished'] as String?,
        dateModified: json['dateModified'] as String?,
        mainEntityOfPage: json['mainEntityOfPage'] == null
            ? null
            : MainEntityOfPage.fromJson(
                json['mainEntityOfPage'] as Map<String, dynamic>),
        wordCount: json['wordCount'] as int?,
        commentCount: json['commentCount'] as int?,
        publisher: json['publisher'] == null
            ? null
            : Publisher.fromJson(json['publisher'] as Map<String, dynamic>),
        image: json['image'] == null
            ? null
            : Image.fromJson(json['image'] as Map<String, dynamic>),
        thumbnailUrl: json['thumbnailUrl'] as String?,
        articleSection: json['articleSection'] as List<String>?,
        inLanguage: json['inLanguage'] as String?,
        potentialAction: (json['potentialAction'] as List<dynamic>?)
            ?.map((e) => PotentialAction.fromJson(e as Map<String, dynamic>))
            .toList(),
        url: json['url'] as String?,
        name: json['name'] as String?,
        primaryImageOfPage: json['primaryImageOfPage'] == null
            ? null
            : PrimaryImageOfPage.fromJson(
                json['primaryImageOfPage'] as Map<String, dynamic>),
        breadcrumb: json['breadcrumb'] == null
            ? null
            : Breadcrumb.fromJson(json['breadcrumb'] as Map<String, dynamic>),
        contentUrl: json['contentUrl'] as String?,
        width: json['width'] as int?,
        height: json['height'] as int?,
        itemListElement: (json['itemListElement'] as List<dynamic>?)
            ?.map((e) => ItemListElement.fromJson(e as Map<String, dynamic>))
            .toList(),
        description: json['description'] as String?,
        logo: json['logo'] == null
            ? null
            : Logo.fromJson(json['logo'] as Map<String, dynamic>),
        sameAs: json['sameAs'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        '@type': type,
        '@id': id,
        'isPartOf': isPartOf?.toJson(),
        'author': author?.toJson(),
        'headline': headline,
        'datePublished': datePublished,
        'dateModified': dateModified,
        'mainEntityOfPage': mainEntityOfPage?.toJson(),
        'wordCount': wordCount,
        'commentCount': commentCount,
        'publisher': publisher?.toJson(),
        'image': image?.toJson(),
        'thumbnailUrl': thumbnailUrl,
        'articleSection': articleSection,
        'inLanguage': inLanguage,
        'potentialAction': potentialAction?.map((e) => e.toJson()).toList(),
        'url': url,
        'name': name,
        'primaryImageOfPage': primaryImageOfPage?.toJson(),
        'breadcrumb': breadcrumb?.toJson(),
        'contentUrl': contentUrl,
        'width': width,
        'height': height,
        'itemListElement': itemListElement?.map((e) => e.toJson()).toList(),
        'description': description,
        'logo': logo?.toJson(),
        'sameAs': sameAs,
      };
}
