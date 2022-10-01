import 'package:wikapi/wikapi.dart';
import 'package:test/test.dart';

void main() {
  group('Test group for get page props wiki function given title', () {
    test('Getting the page props given title in English', () async {
      var res = await Wikipedia.getPageProps(titles: ["milk"], lang: "en");
      expect(res?.results?.first.wikidataId, equals("Q8495"));
      expect(res?.success, isTrue);
    });

    test('Getting the page props given title in German', () async {
      var res = await Wikipedia.getPageProps(titles: ["milch"], lang: "de");
      expect(res?.results?.first.wikidataId, equals("Q8495"));
      expect(res?.success, isTrue);
    });
  });

  group('Test group for get page props wiki function given pageid', () {
    test('Getting the page props given title in English', () async {
      var res = await Wikipedia.getPageProps(ids: [19714], lang: "en");
      expect(res?.results?.first.wikidataId, equals("Q8495"));
      expect(res?.success, isTrue);
    });

    test('Getting the page props given title in German', () async {
      var res = await Wikipedia.getPageProps(ids: [3391], lang: "de");
      expect(res?.results?.first.wikidataId, equals("Q8495"));
      expect(res?.success, isTrue);
    });
  });
}
