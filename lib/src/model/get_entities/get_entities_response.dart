import 'dart:convert';
import 'get_entities_result.dart';

class GetEntitiesResponse {
  final bool success;
  final List<GetEntitiesResult>? results;
  final Map<String, dynamic> rawResponse;

  const GetEntitiesResponse({
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

  factory GetEntitiesResponse.fromMap(Map<String, dynamic> map) {
    List<GetEntitiesResult> mapToResults(Map<String, dynamic> mapEntities) {
      final possibleEntitiesResult = List<GetEntitiesResult>.from(
          mapEntities.values.map((x) => createGetEntitiesResultFromMap(x)));
      final result =
          possibleEntitiesResult.where((element) => element != null).toList();
      return result;
    }

    var results =
        map['entities'] == null ? null : mapToResults(map['entities']);
    return GetEntitiesResponse(
      results: results,
      rawResponse: map,
      success: map['entities'] != null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetEntitiesResponse.fromJson(String source) =>
      GetEntitiesResponse.fromMap(json.decode(source));

  @override
  String toString() => 'GetEntitiesResponse(${toMap().toString()})';
}
