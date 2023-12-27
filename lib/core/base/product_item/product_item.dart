import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:moomalpublication/core/constants/enums.dart';

import 'attribute.dart';
import 'category.dart';
import 'dimensions.dart';
import 'image.dart';
import 'links.dart';
import 'meta_datum.dart';
import 'yoast_head_json.dart';

class ProductItem {
  int? id;
  String? name;
  String? slug;
  String? permalink;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? type;
  String? status;
  bool? featured;
  String? catalogVisibility;
  String? description;
  String? shortDescription;
  String? sku;
  String? price;
  String? regularPrice;
  String? salePrice;
  dynamic dateOnSaleFrom;
  dynamic dateOnSaleFromGmt;
  dynamic dateOnSaleTo;
  dynamic dateOnSaleToGmt;
  bool? onSale;
  bool? purchasable;
  String? totalSales;
  bool? virtual;
  bool? downloadable;
  List<dynamic>? downloads;
  int? downloadLimit;
  int? downloadExpiry;
  String? externalUrl;
  String? buttonText;
  String? taxStatus;
  String? taxClass;
  bool? manageStock;
  dynamic stockQuantity;
  String? backorders;
  bool? backordersAllowed;
  bool? backordered;
  dynamic lowStockAmount;
  bool? soldIndividually;
  String? weight;
  Dimensions? dimensions;
  bool? shippingRequired;
  bool? shippingTaxable;
  String? shippingClass;
  int? shippingClassId;
  bool? reviewsAllowed;
  String? averageRating;
  int? ratingCount;
  List<dynamic>? upsellIds;
  List<dynamic>? crossSellIds;
  int? parentId;
  String? purchaseNote;
  List<Category>? categories;
  List<dynamic>? tags;
  List<Image>? images;
  List<Attribute>? attributes;
  List<dynamic>? defaultAttributes;
  List<int>? variations;
  List<dynamic>? groupedProducts;
  int? menuOrder;
  String? priceHtml;
  List<int>? relatedIds;
  List<MetaDatum>? metaData;
  String? stockStatus;
  bool? hasOptions;
  String? yoastHead;
  YoastHeadJson? yoastHeadJson;
  Links? links;
  Rx<CartBtnType> cartBtnType = Rx(CartBtnType.addToCart);
  int quantity = 0;

  ProductItem({
    this.id,
    this.name,
    this.slug,
    this.permalink,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.type,
    this.status,
    this.featured,
    this.catalogVisibility,
    this.description,
    this.shortDescription,
    this.sku,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.dateOnSaleFrom,
    this.dateOnSaleFromGmt,
    this.dateOnSaleTo,
    this.dateOnSaleToGmt,
    this.onSale,
    this.purchasable,
    this.totalSales,
    this.virtual,
    this.downloadable,
    this.downloads,
    this.downloadLimit,
    this.downloadExpiry,
    this.externalUrl,
    this.buttonText,
    this.taxStatus,
    this.taxClass,
    this.manageStock,
    this.stockQuantity,
    this.backorders,
    this.backordersAllowed,
    this.backordered,
    this.lowStockAmount,
    this.soldIndividually,
    this.weight,
    this.dimensions,
    this.shippingRequired,
    this.shippingTaxable,
    this.shippingClass,
    this.shippingClassId,
    this.reviewsAllowed,
    this.averageRating,
    this.ratingCount,
    this.upsellIds,
    this.crossSellIds,
    this.parentId,
    this.purchaseNote,
    this.categories,
    this.tags,
    this.images,
    this.attributes,
    this.defaultAttributes,
    this.variations,
    this.groupedProducts,
    this.menuOrder,
    this.priceHtml,
    this.relatedIds,
    this.metaData,
    this.stockStatus,
    this.hasOptions,
    this.yoastHead,
    this.yoastHeadJson,
    this.links,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
        id: json['id'] as int?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        permalink: json['permalink'] as String?,
        dateCreated: json['date_created'] as String?,
        dateCreatedGmt: json['date_created_gmt'] as String?,
        dateModified: json['date_modified'] as String?,
        dateModifiedGmt: json['date_modified_gmt'] as String?,
        type: json['type'] as String?,
        status: json['status'] as String?,
        featured: json['featured'] as bool?,
        catalogVisibility: json['catalog_visibility'] as String?,
        description: json['description'] as String?,
        shortDescription: json['short_description'] as String?,
        sku: json['sku'] as String?,
        price: json['price'] as String?,
        regularPrice: json['regular_price'] as String?,
        salePrice: json['sale_price'] as String?,
        dateOnSaleFrom: json['date_on_sale_from'] as dynamic,
        dateOnSaleFromGmt: json['date_on_sale_from_gmt'] as dynamic,
        dateOnSaleTo: json['date_on_sale_to'] as dynamic,
        dateOnSaleToGmt: json['date_on_sale_to_gmt'] as dynamic,
        onSale: json['on_sale'] as bool?,
        purchasable: json['purchasable'] as bool?,
        totalSales: json['total_sales'].toString(),
        virtual: json['virtual'] as bool?,
        downloadable: json['downloadable'] as bool?,
        downloads: json['downloads'] as List<dynamic>?,
        downloadLimit: json['download_limit'] as int?,
        downloadExpiry: json['download_expiry'] as int?,
        externalUrl: json['external_url'] as String?,
        buttonText: json['button_text'] as String?,
        taxStatus: json['tax_status'] as String?,
        taxClass: json['tax_class'] as String?,
        manageStock: json['manage_stock'] as bool?,
        stockQuantity: json['stock_quantity'] as dynamic,
        backorders: json['backorders'] as String?,
        backordersAllowed: json['backorders_allowed'] as bool?,
        backordered: json['backordered'] as bool?,
        lowStockAmount: json['low_stock_amount'] as dynamic,
        soldIndividually: json['sold_individually'] as bool?,
        weight: json['weight'] as String?,
        // dimensions: json['dimensions'] == null ? null : Dimensions.fromJson(json['dimensions'] as Map<String, dynamic>),
        shippingRequired: json['shipping_required'] as bool?,
        shippingTaxable: json['shipping_taxable'] as bool?,
        shippingClass: json['shipping_class'] as String?,
        shippingClassId: json['shipping_class_id'] as int?,
        reviewsAllowed: json['reviews_allowed'] as bool?,
        averageRating: json['average_rating'] as String?,
        ratingCount: json['rating_count'] as int?,
        // upsellIds: json['upsell_ids'] as List<dynamic>?,
        // crossSellIds: json['cross_sell_ids'] as List<dynamic>?,
        parentId: json['parent_id'] as int?,
        purchaseNote: json['purchase_note'] as String?,
        categories: (json['categories'] as List<dynamic>?)
            ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList(),
        // tags: json['tags'] as List<dynamic>?,
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
            .toList(),
        // attributes: (json['attributes'] as List<dynamic>?)?.map((e) => Attribute.fromJson(e as Map<String, dynamic>)).toList(),
        // defaultAttributes: json['default_attributes'] as List<dynamic>?,
        // variations: json['variations'] as List<int>?,
        // groupedProducts: json['grouped_products'] as List<dynamic>?,
        menuOrder: json['menu_order'] as int?,
        priceHtml: json['price_html'] as String?,
        // relatedIds: json['related_ids'] as List<int>?,
        // metaData: (json['meta_data'] as List<dynamic>?)?.map((e) => MetaDatum.fromJson(e as Map<String, dynamic>)).toList(),
        stockStatus: json['stock_status'] as String?,
        // hasOptions: json['has_options'] as bool?,
        // yoastHead: json['yoast_head'] as String?,
        // yoastHeadJson: json['yoast_head_json'] == null ? null : YoastHeadJson.fromJson(json['yoast_head_json'] as Map<String, dynamic>),
        // links: json['_links'] == null ? null : Links.fromJson(json['_links'] as Map<String, dynamic>),
      );
}
