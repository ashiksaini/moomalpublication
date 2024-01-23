import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:moomalpublication/core/constants/enums.dart';

import 'featured_image.dart';
import 'variation.dart';

class ProductItem {
  int? id;
  String? name;
  String? description;
  String? price;
  String? regularPrice;
  String? salePrice;
  String? stockStatus;
  String? type;
  String? sku;
  String? permalink;
  List<dynamic>? categories;
  List<dynamic>? tags;
  FeaturedImage? featuredImage;
  List<Variation>? variations;
  Rx<CartBtnType> cartBtnType = Rx(CartBtnType.addToCart);
  Rx<ProductVariation> productVariationType = Rx(ProductVariation.ebook);
  bool isEbookAvailable = false;
  bool isBookAvailable = false;
  int quantity = 0;
  int? ratingCount;

  ProductItem({
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
    this.sku,
    this.permalink,
    this.featuredImage,
    this.variations,
    this.ratingCount,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        price: json['price'] as String?,
        regularPrice: json['regular_price'] as String?,
        salePrice: json['sale_price'] as String?,
        stockStatus: json['stock_status'] as String?,
        type: json['type'] as String?,
        sku: json['sku'] as String?,
        permalink: json['permalink'] as String?,
        categories: json['categories'] as List<dynamic>?,
        tags: json['tags'] as List<dynamic>?,
        featuredImage: json['featured_image'] == null
            ? null
            : FeaturedImage.fromJson(
                json['featured_image'] as Map<String, dynamic>),
        variations: (json['variations'] as List<dynamic>?)
            ?.map((e) => Variation.fromJson(e as Map<String, dynamic>))
            .toList(),
        ratingCount: json['rating_count'] as int?,
      );
}
