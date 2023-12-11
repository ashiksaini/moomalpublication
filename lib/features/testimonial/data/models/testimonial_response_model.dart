class TestimonialResponseModel {
  final int? id;
  final String? postTitle;
  final String? postContent;
  final String? spTestimonialClientName;
  final String? spTestimonialClientDesignation;

  TestimonialResponseModel({
    this.id,
    this.postTitle,
    this.postContent,
    this.spTestimonialClientName,
    this.spTestimonialClientDesignation,
  });

  factory TestimonialResponseModel.fromJson(Map<String, dynamic> json) => TestimonialResponseModel(
        id: json["ID"] as int?,
        postTitle: json["post_title"] as String?,
        postContent: json["post_content"] as String?,
        spTestimonialClientName: json["sp-testimonial-client-name"] as String?,
        spTestimonialClientDesignation: json["sp-testimonial-client-designation"] as String?,
      );
}
