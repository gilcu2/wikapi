import 'dart:convert';

class GetEntitiesResult {
  final int pageId;
  final String title;
  final int size;
  final int wordcount;
  final String snippet;

  const GetEntitiesResult({
    required this.pageId,
    required this.title,
    required this.size,
    required this.wordcount,
    required this.snippet,
  });

  Map<String, dynamic> toMap() {
    return {
      'pageid': pageId,
      'title': title,
      'size': size,
      'wordcount': wordcount,
      'snippet': snippet,
    };
  }

  factory GetEntitiesResult.fromMap(Map<String, dynamic> map) {
    return GetEntitiesResult(
      pageId: map['pageid'],
      title: map['title'],
      size: map['size'],
      wordcount: map['wordcount'],
      snippet: map['snippet'],
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
