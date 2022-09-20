import 'dart:convert';

class GetEntitiesInfo {
  final int? totalHits;
  final String? suggestion;
  final String? suggestionsnippet;

  const GetEntitiesInfo({
    this.totalHits,
    this.suggestion,
    this.suggestionsnippet,
  });

  GetEntitiesInfo copyWith({
    int? totalHits,
    String? suggestion,
    String? suggestionsnippet,
  }) {
    return GetEntitiesInfo(
      totalHits: totalHits ?? this.totalHits,
      suggestion: suggestion ?? this.suggestion,
      suggestionsnippet: suggestionsnippet ?? this.suggestionsnippet,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalhits': totalHits,
      'suggestion': suggestion,
      'suggestionsnippet': suggestionsnippet,
    };
  }

  factory GetEntitiesInfo.fromMap(Map<String, dynamic> map) {
    return GetEntitiesInfo(
      totalHits: map['totalhits'],
      suggestion: map['suggestion'],
      suggestionsnippet: map['suggestionsnippet'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GetEntitiesInfo.fromJson(String source) =>
      GetEntitiesInfo.fromMap(json.decode(source));

  @override
  String toString() => 'SearchInfo(totalHits: $totalHits, suggestion: $suggestion, suggestionsnippet: $suggestionsnippet)';
}
