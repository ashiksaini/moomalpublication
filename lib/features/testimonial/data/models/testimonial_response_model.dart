class TestimonialResponseModel {
  final String? status;
  final List<StudentList>? data;
  final String? message;

  TestimonialResponseModel({
    this.status,
    this.data,
    this.message,
  });

  factory TestimonialResponseModel.fromJson(Map<String, dynamic> json) =>
      TestimonialResponseModel(
        status: json["status"] as String?,
        data: json["data"] == null
            ? []
            : List<StudentList>.from(
                json["data"]!.map((x) => StudentList.fromJson(x))),
        message: json["message"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class StudentList {
  final int? id;
  final String? postTitle;
  final String? postContent;
  final String? spTestimonialClientName;
  final String? spTestimonialClientDesignation;

  StudentList({
    this.id,
    this.postTitle,
    this.postContent,
    this.spTestimonialClientName,
    this.spTestimonialClientDesignation,
  });

  factory StudentList.fromJson(Map<String, dynamic> json) => StudentList(
        id: json["ID"] as int?,
        postTitle: json["post_title"] as String?,
        postContent: json["post_content"] as String?,
        spTestimonialClientName: json["sp-testimonial-client-name"] as String?,
        spTestimonialClientDesignation:
            json["sp-testimonial-client-designation"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "post_title": postTitle,
        "post_content": postContent,
        "sp-testimonial-client-name": spTestimonialClientName,
        "sp-testimonial-client-designation": spTestimonialClientDesignation,
      };
}
