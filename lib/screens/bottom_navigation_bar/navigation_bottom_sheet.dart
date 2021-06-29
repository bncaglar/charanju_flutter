import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/widgets/bottom_sheet_row.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class NavigationBottomSheet extends StatefulWidget {
  const NavigationBottomSheet({Key? key}) : super(key: key);

  @override
  _NavigationBottomSheetState createState() => _NavigationBottomSheetState();
}

class _NavigationBottomSheetState extends State<NavigationBottomSheet> {
  final log = Logger();

  onClickCreateChallenge() {
    log.i("onClickCreateChallenge Started");
  }

  onClickGoLive() {
    log.i("onClickGoLive Started");
  }

  onClickCreateStory() {
    log.i("onClickCreateStory Started");
  }

  onClickJoinChallenge() {
    log.i("onClickJoinChallenge Started");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildJoinChallengeRow(),
        buildCreateChallengeRow(),
        buildGoLiveRow(),
        buildCreateStoryRow(),
      ],
    );
  }

  BottomSheetRow buildJoinChallengeRow() {
    return BottomSheetRow(
      iconUrl: Strings.HASH_TAG_PNG,
      onClickRow: onClickJoinChallenge,
      rowText: S.of(context).joinChallenge,
    );
  }

  BottomSheetRow buildCreateStoryRow() {
    return BottomSheetRow(
      iconUrl: Strings.CREATE_CHALLENGE_PNG,
      onClickRow: onClickCreateStory,
      rowText: S.of(context).createChallenge,
      padding: EdgeInsets.only(
        top: 3.59.h,
        left: 7.22.w,
      ),
    );
  }

  BottomSheetRow buildGoLiveRow() {
    return BottomSheetRow(
      iconUrl: Strings.GO_LIVE,
      onClickRow: onClickGoLive,
      rowText: S.of(context).goLive,
      padding: EdgeInsets.only(
        top: 3.59.h,
        left: 7.22.w,
      ),
    );
  }

  BottomSheetRow buildCreateChallengeRow() {
    return BottomSheetRow(
      iconUrl: Strings.CREATE_STORY_PNG,
      onClickRow: onClickCreateChallenge,
      rowText: S.of(context).createStory,
      padding: EdgeInsets.only(
        top: 3.59.h,
        left: 7.22.w,
      ),
    );
  }
}
