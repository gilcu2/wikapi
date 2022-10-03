# Getting started

```dart
import 'package:wikapi/wikapi.dart';
import 'dart:io';

Future<void> main(List<String> arguments) async {
  if (arguments.isEmpty) {
    print("Pass terms in the command line");
    exit(1);
  }

  final terms = arguments.join(" ");
  final search_result = await Wikipedia.searchQuery(terms);
  final id = search_result?.results?.first.pageId;
  if (id == null) {
    print("$terms not found");
    exit(2);
  }

  final summary_result = await Wikipedia.summary(id);
  print("Summary: ${summary_result?.extract}");
}
```