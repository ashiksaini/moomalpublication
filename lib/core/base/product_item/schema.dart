import 'graph.dart';

class Schema {
  String? context;
  List<Graph>? graph;

  Schema({this.context, this.graph});

  factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        context: json['@context'] as String?,
        graph: (json['@graph'] as List<dynamic>?)
            ?.map((e) => Graph.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toFrom() => {
        '@context': context,
        '@graph': graph?.map((e) => e.toFrom()).toList(),
      };
}
