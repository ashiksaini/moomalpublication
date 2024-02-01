import 'package:moomalpublication/core/base/variation_request_data.dart';

class AddToCartReqData {
  String? id;
  String? quantity;
  String? key;
  List<VariationRequestData>? variations;

  AddToCartReqData({
    this.id,
    this.quantity,
    this.key,
    this.variations,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (id != null) data.putIfAbsent('id', () => id);
    if (quantity != null) data.putIfAbsent('quantity', () => quantity);
    if (key != null) data.putIfAbsent('key', () => key);
    if (variations != null) {
      data.putIfAbsent(
          'variation',
          () => variations!
              .map((variation) => VariationRequestData(
                    attribute: variation.attribute,
                    value: variation.value,
                  ).toJson())
              .toList());
    }
    return data;
  }
}
