import 'package:charanju_flutter/helper/modules/search_results_module.dart';

class SearchResultData {
  static var results = <SearchResultsModule>[
    SearchResultsModule("search suggestions"),
    SearchResultsModule("search suggestions"),
    SearchResultsModule("search suggestions"),
    SearchResultsModule("search suggestions"),
    SearchResultsModule("search suggestions"),
    SearchResultsModule("search suggestions"),
  ];

  static List<SearchResultsModule> resultsList =
      List.of(SearchResultData.results);
}
