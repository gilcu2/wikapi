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

  final getEntitiesResult = (await WikiData.getEntities(
          entityIds: [entityId], languages: [otherLang]))
      ?.results;
  final titleOtherLang = getEntitiesResult?.first.labels[otherLang];

  final summaryEn = await Wikipedia.summary(pageIdEn, lang: "en");
  print("Summary en: ${summaryEn?.extract}");

  if (titleOtherLang != null) {
    final searchResultOtherLang =
        await Wikipedia.searchQuery(titleOtherLang, lang: otherLang);
    final pageIdOtherLang = searchResultOtherLang?.results?.first.pageId;

    final summaryOtherLang =
        await Wikipedia.summary(pageIdOtherLang!, lang: otherLang);
    print("Summary $otherLang: ${summaryOtherLang?.extract}");
  }
}
