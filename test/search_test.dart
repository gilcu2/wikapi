import 'package:wikapi/wikapi.dart';
import 'package:test/test.dart';

void main() {
  group('Test group for the summary wiki function', () {
    test('Getting the summary from Google wiki page', () async {
      var res = await WikiSearch.summary(1092923);
      expect(res?.title, equals('Google'));
      expect(res?.success, isTrue);
    });

    test('Retrieving the summary using an invalid page id', () async {
      var res = await WikiSearch.summary(999);
      expect(res?.success, isFalse);
      expect(res?.extract, isNull);
    });
  });

  group('Test group for the search wiki function', () {
    test('Query an valid string should not return null', () async {
      var res = await WikiSearch.searchQuery('Google');
      expect(res?.results, isNotEmpty);
      expect(res?.success, isTrue);
    });

    test('Query an invalid string should be empty', () async {
      var res = await WikiSearch.searchQuery('asdasdasd');
      expect(res?.success, isTrue);
      expect(res?.results, isEmpty);
    });
  });

  group('Test group for the search wiki function in German', () {
    test('Query an valid string should not return null', () async {
      var res = await WikiSearch.searchQuery('milch', lang: "de");
      expect(res?.results, isNotEmpty);
      expect(res?.success, isTrue);
    });


  });

  // group('Test group for the random wiki function', () {
  // test('Querying should never return null', () async {
  //   fail('Not implemented');
  // });
  // });
}
