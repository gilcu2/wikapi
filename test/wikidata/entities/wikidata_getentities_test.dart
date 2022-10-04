import 'package:wikapi/src/wikidata.dart';
import 'package:test/test.dart';

void main() {
  group('Test group for the wikidata getEntities function', () {
    test('Getting the entities related to entity Id in de', () async {
      // Given entitie
      final entityId = "Q8495";

      // And desired lang
      var languages = ["de"];

      // When find relation
      var res = await WikiData.getEntities(
          entityIds: [entityId], languages: languages);

      // Must be the expected
      expect(res?.success, isTrue);
      expect(res?.results?[0].labels["de"], "Milch");
    });

    test('Getting the entities related to de milch in en', () async {
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

    test('Getting the entities related to en milk in de', () async {
      // Given title, site
      var titles = ["Milk"];
      var sites = ["enwiki"];

      // And desired lang
      var languages = ["de"];

      // When find relation
      var res = await WikiData.getEntities(
          titles: titles, sites: sites, languages: languages);

      // Must be the expected
      expect(res?.success, isTrue);
      expect(res?.results?[0].labels["de"], "Milch");
    });
  });
}
