class PaymentResult {
  String? paymentStatus;
  List<dynamic>? paymentDetails;
  String? redirectUrl;

  PaymentResult({
    this.paymentStatus,
    this.paymentDetails,
    this.redirectUrl,
  });

  factory PaymentResult.fromJson(Map<String, dynamic> json) => PaymentResult(
        paymentStatus: json['payment_status'] as String?,
        paymentDetails: json['payment_details'] as List<dynamic>?,
        redirectUrl: json['redirect_url'] as String?,
      );
}
