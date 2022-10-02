import 'package:http/http.dart' as http;

import 'model/search/search_response.dart';
import 'model/summary/summary_response.dart';
import 'model/get_pageprops/get_pageprops_response.dart';

enum SearchType {
  nearmatch,
  text,
  /*title*/
}

/// Allows to search  wikipedia pages.
class Wikipedia {
  static const String _baseUrl = '.wikipedia.org';

  /// https://en.wikipedia.org/w/api.php?action=help&modules=query%2Bsearch
  static Future<SearchResponse?> searchQuery(
    String query, {
    int limit = 10,
    int offset = 0,
    SearchType searchType = SearchType.text,
    String lang = 'en',
    Map<String, dynamic>? params,
  }) async {
    if (query.isEmpty) throw ArgumentError.notNull();
    var res = await http.get(Uri(
      scheme: 'https',
      host: '$lang$_baseUrl',
      path: '/w/api.php',
      queryParameters: {
        'action': 'query',
        'list': 'search',
        'srsearch': query,
        "srnamespace": "*",
        'format': 'json',
        'srlimit': '$limit',
        'sroffset': '$offset',
        'srinfo': 'suggestion|totalhits',
        // 'srprop': 'snippet|titlesnippet|sectiontitle|categorysnippet',
        ""
            'srwhat': searchType.toString().split('.').last,
        if (params != null) ...params,
      },
    ));

    if (res.statusCode == 200) {
      return SearchResponse.fromJson(res.body);
    } else {
      return Future.error(res.reasonPhrase ?? 'Error calling wiki summary');
    }
  }

  /// https://en.wikipedia.org/w/api.php?action=help
  static Future<SummaryResponse?> summary(
    int pageId, {
    int thumbnailWidth = 50,
    int thumbnailLimit = 1,
    String lang = 'en',
    Map<String, dynamic>? params,
  }) async {
    var res = await http.get(
      Uri(
        scheme: 'https',
        host: '$lang$_baseUrl',
        path: '/w/api.php',
        queryParameters: {
          'action': 'query',
          'redirects': '1',
          'format': 'json',
          'prop': 'extracts|description|langlinks',
          'exintro': '1',
          'explaintext': '1',
          'pageids': '$pageId',
          'pithumbsize': '$thumbnailWidth',
          'pilimit': '$thumbnailLimit',
          if (params != null) ...params,
        },
      ),
    );

    if (res.statusCode == 200) {
      return SummaryResponse.fromJson(res.body);
    } else {
      return Future.error(res.reasonPhrase ?? 'Error calling wiki summary');
    }
  }

  /// https://www.wikidata.org/w/api.php?action=help
  static Future<GetPagePropsResponse?> getPageProps({
    List<int> ids = const [],
    List<String> titles = const ["milch"],
    List<String> sites = const ["*"],
    String lang = 'en',
  }) async {
    var queryParameters = {
      "action": "query",
      "format": "json",
      "prop": "pageprops",
    };
    _addParameter("sites", sites, queryParameters);
    if (ids.isNotEmpty) {
      _addParameter("pageids", ids, queryParameters);
    } else if (titles.isNotEmpty) {
      _addParameter("titles", titles, queryParameters);
    }

    var res = await http.get(
      Uri(
          scheme: 'https',
          host: "$lang$_baseUrl",
          path: '/w/api.php',
          queryParameters: queryParameters),
    );

    if (res.statusCode == 200) {
      return GetPagePropsResponse.fromJson(res.body);
    } else {
      return Future.error(res.reasonPhrase ?? 'Error calling wiki data');
    }
  }

  static void _addParameter<T>(String parameter, List<T> parameterValues,
      Map<String, String> queryParameters) {
    if (parameterValues != []) {
      queryParameters[parameter] = parameterValues.join("|");
    }
  }
}
