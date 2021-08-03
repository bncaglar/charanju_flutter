import 'package:charanju_flutter/helper/modules/discover_challenges_module.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/search_screen_components/custom_auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SponsorEventChallengeName extends StatelessWidget {
  final DiscoverChallengeModule? discoverChallenge;

  const SponsorEventChallengeName({
    Key? key,
    required this.discoverChallenge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 1.56.h,
        left: 2.77.w,
      ),
      child: Container(
        width: 25.56.w,
        height: 3.43.h,
        child: SearchScreenCustomAutoSizeText(
          content: discoverChallenge!.isSponsorEvent!
              ? discoverChallenge!.challengeName
              : "",
        ),
      ),
    );
  }
}
