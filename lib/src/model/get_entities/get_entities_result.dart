import 'dart:convert';

class GetEntitiesResult {
  final int pageId;
  final String title;
  final Map<String, String> labels;
  final Map<String, String> descriptions;

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
    final labels = Map<String, String>.fromIterable(map['labels'].values,
        key: (x) => x["language"], value: (x) => x["value"]);
    final descriptions = Map<String, String>.fromIterable(
        map['descriptions'].values,
        key: (x) => x["language"],
        value: (x) => x["value"]);
    return GetEntitiesResult(
      pageId: map['pageid'],
      title: map['title'],
      labels: labels,
      descriptions: descriptions,
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

GetEntitiesResult? createGetEntitiesResultFromMap(Map<String, dynamic> map) {
  if (map.containsKey("labels") &&
      map.containsKey('descriptions') &&
      map.containsKey("pageid") &&
      map.containsKey('title')) {
    return GetEntitiesResult.fromMap(map);
  }
  return null;
}
