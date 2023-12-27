import 'links.dart';
import 'yoast_head_json.dart';

class EBookCategoryItem {
  int? id;
  String? name;
  String? slug;
  int? parent;
  String? description;
  String? display;
  dynamic image;
  int? menuOrder;
  int? count;
  String? yoastHead;
  YoastHeadJson? yoastHeadJson;
  Links? links;

  EBookCategoryItem({
    this.id,
    this.name,
    this.slug,
    this.parent,
    this.description,
    this.display,
    this.image,
    this.menuOrder,
    this.count,
    this.yoastHead,
    this.yoastHeadJson,
    this.links,
  });

  factory EBookCategoryItem.fromJson(Map<String, dynamic> json) {
    return EBookCategoryItem(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      parent: json['parent'] as int?,
      description: json['description'] as String?,
      display: json['display'] as String?,
      image: json['image'] as dynamic,
      menuOrder: json['menu_order'] as int?,
      count: json['count'] as int?,
      yoastHead: json['yoast_head'] as String?,
      yoastHeadJson: json['yoast_head_json'] == null
          ? null
          : YoastHeadJson.fromJson(
              json['yoast_head_json'] as Map<String, dynamic>),
      links: json['_links'] == null
          ? null
          : Links.fromJson(json['_links'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'parent': parent,
        'description': description,
        'display': display,
        'image': image,
        'menu_order': menuOrder,
        'count': count,
        'yoast_head': yoastHead,
        'yoast_head_json': yoastHeadJson?.toJson(),
        '_links': links?.toJson(),
      };
}
