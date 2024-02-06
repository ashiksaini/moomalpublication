import 'package:moomalpublication/features/test_series/data/models/term_model.dart';

class TestSeriesListResponseModel {
  final Map<String, Term>? mockTestTerms;
  final Map<String, Term>? topicWiseTerms;

  TestSeriesListResponseModel({
    this.mockTestTerms,
    this.topicWiseTerms,
  });

  factory TestSeriesListResponseModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> mockTestTermsJson =
        json['mock_test_terms'] ?? {};
    final Map<String, dynamic> topicWiseTermsJson =
        json['topic_wise_terms'] ?? {};
    return TestSeriesListResponseModel(
      mockTestTerms: mockTestTermsJson.isNotEmpty
          ? mockTestTermsJson.map(
              (key, value) => MapEntry(key, Term.fromJson(value)),
            )
          : null,
      topicWiseTerms: topicWiseTermsJson.isNotEmpty
          ? topicWiseTermsJson.map(
              (key, value) => MapEntry(key, Term.fromJson(value)),
            )
          : null,
    );
  }
}
