import 'package:http/http.dart' as http;

import 'model/query/query_response.dart';
import 'model/summary_response.dart';

enum SearchType {
  nearmatch,
  text,
  /*title*/
}

/// Allows you to search and query wikipedia pages.
class WikiData {
  static const String _baseUrl = 'www.wikidata.org';

  /// https://www.wikidata.org/w/api.php?action=help
  static Future<SummaryResponse?> getEntities(
      {List<String> titles = const ["milch"],
      List<String> sites = const ["dewiki"],
      List<String> languages = const ["en"]}) async {
    var res = await http.get(
      Uri(
          scheme: 'https',
          host: _baseUrl,
          path: '/w/api.php',
          queryParameters: {
            "action": "wbgetentities",
            'sites': sites.join("|"),
            'titles': titles.join("|"),
            'languages': languages.join("|"),
            "format": "json",
          }),
    );

    if (res.statusCode == 200) {
      return SummaryResponse.fromJson(res.body);
    } else {
      return Future.error(res.reasonPhrase ?? 'Error calling wiki data');
    }
  }
}
