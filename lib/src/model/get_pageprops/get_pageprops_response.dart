import 'dart:convert';
import 'get_pageprops_result.dart';

class GetPagePropsResponse {
  final bool success;
  final List<GetPagePropsResult>? results;
  final Map<String, dynamic> rawResponse;

  const GetPagePropsResponse({
    required this.success,
    required this.rawResponse,
    this.results,
  });

  Map<String, dynamic> toMap() {
    return {
      'results': results?.map((x) => x.toMap()).toList(),
      'success': success,
      'rawResponse': rawResponse,
    };
  }

  factory GetPagePropsResponse.fromMap(Map<String, dynamic> map) {
    List<GetPagePropsResult> mapToResults(Map<String, dynamic> mapEntities) {
      return List<GetPagePropsResult>.from(
          mapEntities.values.map((x) => GetPagePropsResult.fromMap(x)));
    }

    var results =
        map['query'] == null ? null : mapToResults(map['query']["pages"]);
    return GetPagePropsResponse(
      results: results,
      rawResponse: map,
      success: map['query'] != null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetPagePropsResponse.fromJson(String source) =>
      GetPagePropsResponse.fromMap(json.decode(source));

  @override
  String toString() => 'SearchResponse(${toMap().toString()})';
}
