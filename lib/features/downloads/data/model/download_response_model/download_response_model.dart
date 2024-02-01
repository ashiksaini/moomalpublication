class DownloadResponseModel {
  int? orderId;
  String? productName;
  String? downloadUrl;
  String? imageUrl;
  String? dateOfPurchase;

  DownloadResponseModel({
    this.orderId,
    this.productName,
    this.downloadUrl,
    this.imageUrl,
    this.dateOfPurchase,
  });

  factory DownloadResponseModel.fromJson(Map<String, dynamic> json) {
    String val = "";
    if (json['image_url'] != null && json['image_url'] is String) {
      val = json['image_url'];
    }

    return DownloadResponseModel(
      orderId: json['order_id'] as int?,
      productName: json['product_name'] as String?,
      downloadUrl: json['download_url'] as String?,
      imageUrl: val,
      dateOfPurchase: json['date_of_purchase'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'order_id': orderId,
        'product_name': productName,
        'download_url': downloadUrl,
        'image_url': imageUrl,
        'date_of_purchase': dateOfPurchase,
      };
}
