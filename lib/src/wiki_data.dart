import 'package:http/http.dart' as http;

import 'model/get_entities/get_entities_info.dart';
import 'model/get_entities/get_entities_response.dart';

enum SearchType {
  nearmatch,
  text,
  /*title*/
}

/// Allows you to search and query wikipedia pages.
class WikiData {
  static const String _baseUrl = 'www.wikidata.org';

  /// https://www.wikidata.org/w/api.php?action=help
  static Future<GetEntitiesResponse?> getEntities(
      {List<String> ids = const [],
      List<String> titles = const ["milch"],
      List<String> sites = const ["dewiki"],
      List<String> languages = const ["en"]}) async {
    var queryParameters = {
      "action": "wbgetentities",
      "format": "json",
    };
    addParameter("ids", ids, queryParameters);
    addParameter("sites", sites, queryParameters);
    addParameter("titles", titles, queryParameters);
    addParameter("languages", languages, queryParameters);

    var res = await http.get(
      Uri(
          scheme: 'https',
          host: _baseUrl,
          path: '/w/api.php',
          queryParameters: queryParameters),
    );

    if (res.statusCode == 200) {
      return GetEntitiesResponse.fromJson(res.body);
    } else {
      return Future.error(res.reasonPhrase ?? 'Error calling wiki data');
    }
  }

  static void addParameter(String parameter, List<String> parameterValues,
      Map<String, String> queryParameters) {
    if (parameterValues != []) {
      queryParameters[parameter] = parameterValues.join("|");
    }
  }
}
