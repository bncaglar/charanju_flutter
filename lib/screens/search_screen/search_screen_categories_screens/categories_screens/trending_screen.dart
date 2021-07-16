import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/modules/discover_challenges_module.dart';
import 'package:charanju_flutter/logger/simple_log_printer.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/search_screen_components/background_split_image_row.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/search_screen_components/custom_auto_size_text.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/search_screen_components/number_of_challenge.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/search_screen_components/sponsor_events/sponsor_event_part.dart';
import 'package:charanju_flutter/helper/dummy_data/search_screen_data.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TrendingScreen extends StatefulWidget {
  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  final log = getLogger();

  onTapTitle() {
    log.i("onTapTitle Started");
  }

  @override
  Widget build(BuildContext context) {
    return buildTrendingPage(SearchScreenData.discoverChallenges);
  }

  Widget buildTrendingPage(List<DiscoverChallengeModule> discoverChallenges) {
    return Container(
      child: ListView.builder(
        itemCount: discoverChallenges.length,
        itemBuilder: (context, index) {
          final DiscoverChallengeModule discoverChallenge =
              discoverChallenges[index];
          return discoverChallenge.category == S.of(context).trending
              ? buildDiscoverListTile(discoverChallenge)
              : Container();
        },
      ),
    );
  }

  Widget buildDiscoverListTile(discoverChallenge) => ListTile(
        contentPadding: EdgeInsets.zero,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            discoverChallenge.isSponsorEvent
                ? SponsorEventPart(discoverChallenge: discoverChallenge)
                : Container(),
            discoverChallenge.isSponsorEvent
                ? Container()
                : buildChallengeHashTagRow(discoverChallenge),
          ],
        ),
      );

  Container buildChallengeHashTagRow(discoverChallenge) {
    return Container(
      child: Column(
        children: [
          buildChallengeTitle(discoverChallenge),
          SizedBox(height: 1.09.h),
          buildChallengeSplitImages(discoverChallenge)
        ],
      ),
    );
  }

  SingleChildScrollView buildChallengeSplitImages(discoverChallenge) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          discoverChallenge.challengeName == S.of(context).outDoorChallenge
              ? BackgroundSplitImageRow(
                  leftPhotoPath: discoverChallenge.challengePhotoLeft,
                  rightPhotoPath: discoverChallenge.challengePhotoRight)
              : Container(),
          discoverChallenge.challengeName == S.of(context).newStyle
              ? BackgroundSplitImageRow(
                  leftPhotoPath: discoverChallenge.challengePhotoLeft,
                  rightPhotoPath: discoverChallenge.challengePhotoRight)
              : Container(),
          discoverChallenge.challengeName == S.of(context).dogPortrait
              ? BackgroundSplitImageRow(
                  leftPhotoPath: discoverChallenge.challengePhotoLeft,
                  rightPhotoPath: discoverChallenge.challengePhotoRight)
              : Container(),
        ],
      ),
    );
  }

  GestureDetector buildChallengeTitle(discoverChallenge) {
    return GestureDetector(
      onTap: onTapTitle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 3.05.w,
            ),
            child: buildChallengeHashTagName(discoverChallenge),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 2.77.w,
            ),
            child: NumberOfChallenge(discoverChallenge: discoverChallenge),
          )
        ],
      ),
    );
  }

  SearchScreenCustomAutoSizeText buildChallengeHashTagName(discoverChallenge) {
    return SearchScreenCustomAutoSizeText(
        content: discoverChallenge.challengeName, fontFamily: Strings.C_MULISH);
  }
}
