import 'dart:convert';

class GetPagePropsResult {
  final int pageId;
  final String title;
  final String wikidataId;

  const GetPagePropsResult({
    required this.pageId,
    required this.title,
    required this.wikidataId,
  });

  Map<String, dynamic> toMap() {
    return {
      "pageid": pageId,
      'title': title,
      "wikibase_item": wikidataId,
    };
  }

  factory GetPagePropsResult.fromMap(Map<String, dynamic> map) {
    return GetPagePropsResult(
      pageId: map['pageid'],
      title: map['title'],
      wikidataId: map['pageprops']["wikibase_item"],
    );
  }

  String toJson() => json.encode(toMap());

  factory GetPagePropsResult.fromJson(String source) =>
      GetPagePropsResult.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SearchResult(${toMap().toString()})';
  }
}
