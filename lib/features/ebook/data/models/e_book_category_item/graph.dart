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
  Breadcrumb? breadcrumb;
  String? inLanguage;
  List<ItemListElement>? itemListElement;
  String? description;
  Publisher? publisher;
  List<PotentialAction>? potentialAction;
  Logo? logo;
  Image? image;

  Graph({
    this.type,
    this.id,
    this.url,
    this.name,
    this.isPartOf,
    this.breadcrumb,
    this.inLanguage,
    this.itemListElement,
    this.description,
    this.publisher,
    this.potentialAction,
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
        breadcrumb: json['breadcrumb'] == null
            ? null
            : Breadcrumb.fromJson(json['breadcrumb'] as Map<String, dynamic>),
        inLanguage: json['inLanguage'] as String?,
        itemListElement: (json['itemListElement'] as List<dynamic>?)
            ?.map((e) => ItemListElement.fromJson(e as Map<String, dynamic>))
            .toList(),
        description: json['description'] as String?,
        publisher: json['publisher'] == null
            ? null
            : Publisher.fromJson(json['publisher'] as Map<String, dynamic>),
        potentialAction: (json['potentialAction'] as List<dynamic>?)
            ?.map((e) => PotentialAction.fromJson(e as Map<String, dynamic>))
            .toList(),
        logo: json['logo'] == null
            ? null
            : Logo.fromJson(json['logo'] as Map<String, dynamic>),
        image: json['image'] == null
            ? null
            : Image.fromJson(json['image'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        '@type': type,
        '@id': id,
        'url': url,
        'name': name,
        'isPartOf': isPartOf?.toJson(),
        'breadcrumb': breadcrumb?.toJson(),
        'inLanguage': inLanguage,
        'itemListElement': itemListElement?.map((e) => e.toJson()).toList(),
        'description': description,
        'publisher': publisher?.toJson(),
        'potentialAction': potentialAction?.map((e) => e.toJson()).toList(),
        'logo': logo?.toJson(),
        'image': image?.toJson(),
      };
}
