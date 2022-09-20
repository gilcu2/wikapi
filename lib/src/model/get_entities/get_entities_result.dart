import 'dart:convert';

class GetEntitiesResult {
  final int pageId;
  final String title;
  final List<Map<String, String>> labels;
  final List<Map<String, String>> descriptions;

  const GetEntitiesResult({
    required this.pageId,
    required this.title,
    required this.labels,
    required this.descriptions,
  });

  Map<String, dynamic> toMap() {
    return {
      'pageid': pageId,
      'title': title,
      'labels': labels,
      'descriptions': descriptions,
    };
  }

  factory GetEntitiesResult.fromMap(Map<String, dynamic> map) {
    return GetEntitiesResult(
      pageId: map['pageid'],
      title: map['title'],
      labels: map['labels'],
      descriptions: map['descriptions'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GetEntitiesResult.fromJson(String source) =>
      GetEntitiesResult.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SearchResult(${toMap().toString()})';
  }
}
