import 'dart:convert';

import 'get_entities_info.dart';
import 'get_entities_result.dart';

class GetEntitiesResponse {
  final bool success;
  final List<GetEntitiesResult>? results;
  final int? offset;
  final GetEntitiesInfo? searchInfo;
  final Map<String, dynamic> rawResponse;

  const GetEntitiesResponse({
    required this.success,
    required this.rawResponse,
    this.results,
    this.offset,
    this.searchInfo,
  });

  Map<String, dynamic> toMap() {
    return {
      'results': results?.map((x) => x.toMap()).toList(),
      'offset': offset,
      'searchInfo': searchInfo?.toMap(),
      'success': success,
      'rawResponse': rawResponse,
    };
  }

  factory GetEntitiesResponse.fromMap(Map<String, dynamic> map) {
    return GetEntitiesResponse(
      results: map['query']?['search'] == null
          ? null
          : List<GetEntitiesResult>.from(map['query']?['search']
              ?.map((x) => GetEntitiesResult.fromMap(x))),
      offset: map['offset'],
      searchInfo: map['query']?['searchinfo'] == null
          ? null
          : GetEntitiesInfo.fromMap(map['query']?['searchinfo']),
      rawResponse: map,
      success: map['query']?['search'] != null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetEntitiesResponse.fromJson(String source) =>
      GetEntitiesResponse.fromMap(json.decode(source));

  @override
  String toString() => 'SearchResponse(${toMap().toString()})';
}
