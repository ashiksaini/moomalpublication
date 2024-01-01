import 'links.dart';

class ReviewPostResponseData {
  int? id;
  String? dateCreated;
  String? dateCreatedGmt;
  int? productId;
  String? productName;
  String? productPermalink;
  String? status;
  String? reviewer;
  String? reviewerEmail;
  String? review;
  int? rating;
  bool? verified;
  Links? links;

  ReviewPostResponseData({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.productId,
    this.productName,
    this.productPermalink,
    this.status,
    this.reviewer,
    this.reviewerEmail,
    this.review,
    this.rating,
    this.verified,
    this.links,
  });

  factory ReviewPostResponseData.fromJson(Map<String, dynamic> json) {
    return ReviewPostResponseData(
      id: json['id'] as int?,
      dateCreated: json['date_created'] as String?,
      dateCreatedGmt: json['date_created_gmt'] as String?,
      productId: json['product_id'] as int?,
      productName: json['product_name'] as String?,
      productPermalink: json['product_permalink'] as String?,
      status: json['status'] as String?,
      reviewer: json['reviewer'] as String?,
      reviewerEmail: json['reviewer_email'] as String?,
      review: json['review'] as String?,
      rating: json['rating'] as int?,
      verified: json['verified'] as bool?,
      links: json['_links'] == null
          ? null
          : Links.fromJson(json['_links'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'date_created': dateCreated,
        'date_created_gmt': dateCreatedGmt,
        'product_id': productId,
        'product_name': productName,
        'product_permalink': productPermalink,
        'status': status,
        'reviewer': reviewer,
        'reviewer_email': reviewerEmail,
        'review': review,
        'rating': rating,
        'verified': verified,
        '_links': links?.toJson(),
      };
}
