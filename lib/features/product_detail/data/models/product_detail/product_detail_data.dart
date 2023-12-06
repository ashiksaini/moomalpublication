import 'featured_image.dart';
import 'variation.dart';

class ProductDetailData {
  int? id;
  String? name;
  String? description;
  String? price;
  String? regularPrice;
  String? salePrice;
  String? stockStatus;
  String? type;
  List<dynamic>? categories;
  List<dynamic>? tags;
  FeaturedImage? featuredImage;
  List<Variation>? variations;

  ProductDetailData({
    this.id,
    this.name,
    this.description,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.stockStatus,
    this.type,
    this.categories,
    this.tags,
    this.featuredImage,
    this.variations,
  });

  factory ProductDetailData.fromJson(Map<String, dynamic> json) {
    return ProductDetailData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      regularPrice: json['regular_price'] as String?,
      salePrice: json['sale_price'] as String?,
      stockStatus: json['stock_status'] as String?,
      type: json['type'] as String?,
      categories: json['categories'] as List<dynamic>?,
      tags: json['tags'] as List<dynamic>?,
      featuredImage: json['featured_image'] == null
          ? null
          : FeaturedImage.fromJson(
              json['featured_image'] as Map<String, dynamic>),
      variations: (json['variations'] as List<dynamic>?)
          ?.map((e) => Variation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
