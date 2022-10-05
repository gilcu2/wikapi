import 'package:wikapi/wikapi.dart';
import 'dart:io';
import 'package:args/args.dart';

Future<void> main(List<String> arguments) async {
  final parser = ArgParser()..addOption('otherLang', defaultsTo: "de");
  final argResults = parser.parse(arguments);
  final otherLang = argResults['otherLang'];
  final terms = argResults.rest.isNotEmpty ? argResults.rest : ["milk"];

  final termsStr = terms.join(" ");
  final searchResult = await Wikipedia.searchQuery(termsStr);
  final pageIdEn = searchResult?.results?.first.pageId;

  if (pageIdEn == null) {
    print("Terms: $terms not found");
    exit(1);
  }

  final entityId = (await Wikipedia.getPageProps(pageIds: [pageIdEn]))
      ?.results
      ?.first
      .entityId;

  if (entityId == null) {
    print("Entity not found");
    exit(1);
  }

  final pageIdOtherLang = (await WikiData.getEntities(
          entityIds: [entityId], languages: [otherLang]))
      ?.results
      ?.first
      .pageId;

  final summaryEn = await Wikipedia.summary(pageIdEn, lang: "en");
  print("Summary en: ${summaryEn?.extract}");

  if (pageIdOtherLang != null) {
    final summaryOtherLang = await Wikipedia.summary(pageIdOtherLang);
    print("Summary $otherLang: ${summaryOtherLang?.extract}");
  }
}
