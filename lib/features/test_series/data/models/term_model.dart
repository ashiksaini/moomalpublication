class Term {
  final int? termId;
  final String? name;
  final String? slug;
  final int? termGroup;
  final int? termTaxonomyId;
  final String? taxonomy;
  final String? description;
  final int? parent;
  final int? count;
  final String? filter;

  Term({
    this.termId,
    this.name,
    this.slug,
    this.termGroup,
    this.termTaxonomyId,
    this.taxonomy,
    this.description,
    this.parent,
    this.count,
    this.filter,
  });

  factory Term.fromJson(Map<String, dynamic> json) {
   return Term(
      termId: json["term_id"] as int?,
      name: json["name"] as String?,
      slug: json["slug"] as String?,
      termGroup: json["term_group"] as int?,
      termTaxonomyId: json["term_taxonomy_id"] as int?,
      taxonomy: json["taxonomy"] as String?,
      description: json["description"] as String?,
      parent: json["parent"] as int?,
      count: json["count"] as int?,
      filter: json["filter"] as String?,
    );
  }

}