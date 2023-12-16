import 'breadcrumb.dart';
import 'image.dart';
import 'is_part_of.dart';
import 'item_list_element.dart';
import 'logo.dart';
import 'potential_action.dart';
import 'publisher.dart';

class Graph {
  String? type;
  String? id;
  String? url;
  String? name;
  IsPartOf? isPartOf;
  String? datePublished;
  String? dateModified;
  Breadcrumb? breadcrumb;
  String? inLanguage;
  List<PotentialAction>? potentialAction;
  List<ItemListElement>? itemListElement;
  String? description;
  Publisher? publisher;
  Logo? logo;
  Image? image;

  Graph({
    this.type,
    this.id,
    this.url,
    this.name,
    this.isPartOf,
    this.datePublished,
    this.dateModified,
    this.breadcrumb,
    this.inLanguage,
    this.potentialAction,
    this.itemListElement,
    this.description,
    this.publisher,
    this.logo,
    this.image,
  });

  factory Graph.fromJson(Map<String, dynamic> json) => Graph(
        type: json['@type'] as String?,
        id: json['@id'] as String?,
        url: json['url'] as String?,
        name: json['name'] as String?,
        isPartOf: json['isPartOf'] == null
            ? null
            : IsPartOf.fromJson(json['isPartOf'] as Map<String, dynamic>),
        datePublished: json['datePublished'] as String?,
        dateModified: json['dateModified'] as String?,
        breadcrumb: json['breadcrumb'] == null
            ? null
            : Breadcrumb.fromJson(json['breadcrumb'] as Map<String, dynamic>),
        inLanguage: json['inLanguage'] as String?,
        potentialAction: (json['potentialAction'] as List<dynamic>?)
            ?.map((e) => PotentialAction.fromJson(e as Map<String, dynamic>))
            .toList(),
        itemListElement: (json['itemListElement'] as List<dynamic>?)
            ?.map((e) => ItemListElement.fromJson(e as Map<String, dynamic>))
            .toList(),
        description: json['description'] as String?,
        publisher: json['publisher'] == null
            ? null
            : Publisher.fromJson(json['publisher'] as Map<String, dynamic>),
        logo: json['logo'] == null
            ? null
            : Logo.fromJson(json['logo'] as Map<String, dynamic>),
        image: json['image'] == null
            ? null
            : Image.fromJson(json['image'] as Map<String, dynamic>),
      );
}
