import 'package:moomalpublication/features/cart/data/models/cart_data/extensions.dart';
import 'package:moomalpublication/features/cart/data/models/cart_data/image.dart';
import 'package:moomalpublication/features/cart/data/models/cart_data/prices.dart';
import 'package:moomalpublication/features/cart/data/models/cart_data/quantity_limits.dart';
import 'package:moomalpublication/features/cart/data/models/cart_data/totals.dart';
import 'package:moomalpublication/features/cart/data/models/cart_data/variation.dart';

class Item {
  String? key;
  String? name;
  int? quantity;
  int? id;
  QuantityLimits? quantityLimits;
  String? shortDescription;
  String? description;
  String? sku;
  int? lowStockRemaining;
  bool? backordersAllowed;
  bool? showBackorderBadge;
  bool? soldIndividually;
  String? permalink;
  List<Image>? images;
  List<Variation>? variation;
  List<Map<String, dynamic>>? itemData;
  Prices? prices;
  Totals? totals;
  String? catalogVisibility;
  Extensions? extensions;

  Item({
    this.key,
    this.name,
    this.quantity,
    this.id,
    this.quantityLimits,
    this.shortDescription,
    this.description,
    this.sku,
    this.lowStockRemaining,
    this.backordersAllowed,
    this.showBackorderBadge,
    this.soldIndividually,
    this.permalink,
    this.images,
    this.variation,
    this.itemData,
    this.prices,
    this.totals,
    this.catalogVisibility,
    this.extensions,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        key: json['key'] as String?,
        name: json['name'] as String?,
        quantity: json['quantity'] as int?,
        id: json['id'] as int?,
        quantityLimits: json['quantity_limits'] != null
            ? QuantityLimits.fromJson(
                json['quantity_limits'] as Map<String, dynamic>)
            : null,
        shortDescription: json['short_description'] as String?,
        description: json['description'] as String?,
        sku: json['sku'] as String?,
        lowStockRemaining: json['low_stock_remaining'] as int?,
        backordersAllowed: json['backorders_allowed'] as bool?,
        showBackorderBadge: json['show_backorder_badge'] as bool?,
        soldIndividually: json['sold_individually'] as bool?,
        permalink: json['permalink'] as String?,
        images: (json['images'] as List<dynamic>?)
            ?.map((item) => Image.fromJson(item as Map<String, dynamic>))
            .toList(),
        // variation: (json['variation'] as List<dynamic>?)?.map((item) => Variation.fromJson(item as Map<String, dynamic>)).toList(),
        itemData: (json['item_data'] as List<dynamic>?)
            ?.map((e) => e as Map<String, dynamic>)
            .toList(),
        prices: json['prices'] != null
            ? Prices.fromJson(json['prices'] as Map<String, dynamic>)
            : null,
        totals: json['totals'] != null
            ? Totals.fromJson(json['totals'] as Map<String, dynamic>)
            : null,
        catalogVisibility: json['catalog_visibility'] as String?,
        // extensions: json['extensions'] as Map<String, dynamic>?,
      );
}
