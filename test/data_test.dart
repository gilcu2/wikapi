import 'package:wikapi/src/wiki_data.dart';
import 'package:wikapi/wikapi.dart';
import 'package:test/test.dart';

void main() {
  group('Test group for the wikidata function', () {
    test('Getting the entities related to milch', () async {
      // Given title, site
      var titles = ["Milch"];
      var sites = ["dewiki"];

      // And desired lang

      // When find relation
      var res = await WikiData.getEntities(titles: titles);

      // Must be the expected
      expect(res?.success, isTrue);
    });
  });
}
