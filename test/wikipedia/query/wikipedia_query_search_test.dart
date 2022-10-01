import 'package:wikapi/wikapi.dart';
import 'package:test/test.dart';

void main() {
  group('Test group for wikipedia query search function English', () {
    test('Query an valid string should not return null', () async {
      var res = await Wikipedia.searchQuery('Google');
      expect(res?.results, isNotEmpty);
      expect(res?.success, isTrue);
    });

    test('Query an invalid string should find nearest terms', () async {
      var res = await Wikipedia.searchQuery('asdasdasd');
      expect(res?.success, isTrue);
      expect(res?.results, isNotEmpty);
    });
  });

  group('Test group for wikipedia query search function in German', () {
    test('Query an valid string should not return null', () async {
      var res = await Wikipedia.searchQuery('milch', lang: "de");
      expect(res?.results, isNotEmpty);
      expect(res?.success, isTrue);
    });
  });
}
