import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/helper/modules/search_results_module.dart';
import 'package:charanju_flutter/screens/search_screen/search_challenges_results/search_challenges_result_data.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchChallengesResultBuilder extends StatefulWidget {
  @override
  _SearchChallengesResultBuilderState createState() =>
      _SearchChallengesResultBuilderState();
}

class _SearchChallengesResultBuilderState
    extends State<SearchChallengesResultBuilder> {
  List<SearchResultsModule> results = List.of(SearchResultData.results);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext _context) {
      return buildResults(results);
    });
  }

  Widget buildResults(List<SearchResultsModule> results) {
    return Padding(
      padding: EdgeInsets.only(top: 1.718.h, left: 13.61.w),
      child: Container(
        child: ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            final result = results[index];
            return resultBody(result);
          },
        ),
      ),
    );
  }

  Padding resultBody(result) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.09.h),
      child: Container(
        height: 3.59.h,
        width: 35.8.w,
        child: Align(
          alignment: Alignment.centerLeft,
          child: searchResultText(result),
        ),
      ),
    );
  }

  AutoSizeText searchResultText(result) {
    return AutoSizeText(
      result.searchResult,
      style: TextStyle(
        fontSize: LocalHelper.getFontSize(15),
        color: AppColors.primaryGreyColor,
        fontWeight: FontWeight.w400,
        fontFamily: Strings.ARIAL,
      ),
      maxLines: 8,
      textAlign: TextAlign.left,
    );
  }
}
