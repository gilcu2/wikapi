import 'package:wikapi/wikapi.dart';
import 'package:test/test.dart';

void main() {
  group('Test group for wikipedia query search function English', () {
    test('Query an valid string should not return null', () async {
      var res = await Wikipedia.searchQuery('milk', lang: "en");
      expect(res?.success, isTrue);
      expect(res?.results, isNotEmpty);
      expect(res?.results?.first.pageId, 19714);
    });

    test('Query an invalid string should find nearest terms', () async {
      var res = await Wikipedia.searchQuery('asdasdasd');
      expect(res?.success, isTrue);
      expect(res?.results, isNotEmpty);
    });
  });

  group('Test group for wikipedia query search function in German', () {
    test('Query an valid string should not return null', () async {
      var res = await Wikipedia.searchQuery('Milch', lang: "de");
      expect(res?.success, isTrue);
      expect(res?.results, isNotEmpty);
      expect(res?.results?.first.pageId, 3391);
    });
  });
}
