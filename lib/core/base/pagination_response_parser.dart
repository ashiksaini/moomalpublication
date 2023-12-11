class PaginationResponseParser<T> {
  String? count;
  String? page;
  String? totalPages;
  String? pageSize;
  List<T>? results;

  PaginationResponseParser({
    this.count,
    this.page,
    this.totalPages,
    this.pageSize,
    this.results,
  });
  factory PaginationResponseParser.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonItem,
  ) {
    try {
      return PaginationResponseParser<T>(
        count: json['count']?.toString(),
        page: json['page']?.toString(),
        totalPages: json['total_pages']?.toString(),
        pageSize: json['page_size']?.toString(),
        results: (json['results'] != null)
            ? List<T>.from(
                (json['results'] as List<dynamic>).map(
                  (item) => fromJsonItem(item),
                ),
              )
            : [],
      );
    } catch (e) {
      throw FormatException(e.toString());
    }
  }
}
