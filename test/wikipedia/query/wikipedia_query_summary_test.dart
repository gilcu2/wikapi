import 'package:wikapi/wikapi.dart';
import 'package:test/test.dart';

void main() {
  group('Test group for query summary wiki function', () {
    test('Getting the summary from Google wiki page', () async {
      var res = await Wikipedia.summary(1092923);
      expect(res?.title, equals('Google'));
      expect(res?.success, isTrue);
    });

    test('Retrieving the summary using an invalid page id', () async {
      var res = await Wikipedia.summary(999);
      expect(res?.success, isFalse);
      expect(res?.extract, isNull);
    });
  });
}
