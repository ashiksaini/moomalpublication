class ProductReview {
  String? id;
  String? author;
  String? email;
  String? content;
  String? rating;
  String? date;

  ProductReview({
    this.id,
    this.author,
    this.email,
    this.content,
    this.rating,
    this.date,
  });

  factory ProductReview.fromJson(Map<String, dynamic> json) => ProductReview(
        id: json['id'] as String?,
        author: json['author'] as String?,
        email: json['email'] as String?,
        content: json['content'] as String?,
        rating: json['rating'] as String?,
        date: json['date'] as String?,
      );
}
