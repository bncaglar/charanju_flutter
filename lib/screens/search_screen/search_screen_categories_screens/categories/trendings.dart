import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/modules/discover_challenges_module.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/search_screen_components/background_split_image.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/search_screen_components/background_split_image_row.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/search_screen_components/custom_auto_size_text.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/search_screen_components/number_of_challenge.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/search_screen_components/sponsor_event_part.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import '../search_screen_data.dart';
import 'package:sizer/sizer.dart';

class TrendingPage extends StatefulWidget {
  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  List<DiscoverChallengeModule> discoverChallenges =
      List.of(SearchScreenData.screenData);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext _context) {
      return buildTrendingPage(discoverChallenges);
    });
  }

  Widget buildTrendingPage(List<DiscoverChallengeModule> discoverChallenges) {
    return Container(
      child: ListView.builder(
        itemCount: discoverChallenges.length,
        itemBuilder: (context, index) {
          final discoverChallenge = discoverChallenges[index];
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
                ? SponsorEventPage(discoverChallenge: discoverChallenge)
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

  Row buildChallengeTitle(discoverChallenge) {
    return Row(
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
    );
  }

  SearchScreenCustomAutoSizeText buildChallengeHashTagName(discoverChallenge) {
    return SearchScreenCustomAutoSizeText(
        content: discoverChallenge.challengeName, fontFamily: Strings.MULISH);
  }
}
