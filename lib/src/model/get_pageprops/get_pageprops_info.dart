import 'dart:convert';

class GetPagePropsInfo {
  final int? totalHits;
  final String? suggestion;
  final String? suggestionsnippet;

  const GetPagePropsInfo({
    this.totalHits,
    this.suggestion,
    this.suggestionsnippet,
  });

  GetPagePropsInfo copyWith({
    int? totalHits,
    String? suggestion,
    String? suggestionsnippet,
  }) {
    return GetPagePropsInfo(
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

  factory GetPagePropsInfo.fromMap(Map<String, dynamic> map) {
    return GetPagePropsInfo(
      totalHits: map['totalhits'],
      suggestion: map['suggestion'],
      suggestionsnippet: map['suggestionsnippet'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GetPagePropsInfo.fromJson(String source) =>
      GetPagePropsInfo.fromMap(json.decode(source));

  @override
  String toString() =>
      'SearchInfo(totalHits: $totalHits, suggestion: $suggestion, suggestionsnippet: $suggestionsnippet)';
}
