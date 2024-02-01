import 'destination.dart';
import 'item.dart';

class ShippingRate {
  int? packageId;
  String? name;
  Destination? destination;
  List<Item>? items;
  List<ShippingRate>? shippingRates;

  ShippingRate({
    this.packageId,
    this.name,
    this.destination,
    this.items,
    this.shippingRates,
  });

  factory ShippingRate.fromJson(Map<String, dynamic> json) => ShippingRate(
        packageId: json['package_id'] as int?,
        name: json['name'] as String?,
        destination: json['destination'] == null
            ? null
            : Destination.fromJson(json['destination'] as Map<String, dynamic>),
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
        shippingRates: (json['shipping_rates'] as List<dynamic>?)
            ?.map((e) => ShippingRate.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
