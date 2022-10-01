import 'package:wikapi/src/wikidata.dart';
import 'package:test/test.dart';

void main() {
  group('Test group for the wikidata function', () {
    test('Getting the entities related to milch', () async {
      // Given title, site
      var titles = ["Milch"];
      var sites = ["dewiki"];

      // And desired lang
      var languages = ["en"];

      // When find relation
      var res = await WikiData.getEntities(
          titles: titles, sites: sites, languages: languages);

      // Must be the expected
      expect(res?.success, isTrue);
      expect(res?.results?[0].labels["en"], "milk");
    });
  });
}
