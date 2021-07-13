import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/modules/discover_challenges_module.dart';

class SearchScreenData {
  static var screenData = <DiscoverChallengeModule>[
    DiscoverChallengeModule(
        challengeName: S.current.colaChallenge,
        isSponsorEvent: true,
        sponsorEventHeaderPhoto: Strings.SPONSOR_HEADER_PHOTO,
        category: S.current.trending),
    DiscoverChallengeModule(
        challengeName: S.current.outDoorChallenge,
        isSponsorEvent: false,
        challengePhotoLeft: Strings.DISCOVER_CHALLENGE_PHOTO_LEFT,
        challengePhotoRight: Strings.DISCOVER_CHALLENGE_PHOTO_RIGHT,
        numberOfChallenge: "1.9B",
        category: S.current.trending),
    DiscoverChallengeModule(
        challengeName: S.current.newStyle,
        isSponsorEvent: false,
        challengePhotoLeft: Strings.DISCOVER_CHALLENGE_PHOTO_LEFT1,
        challengePhotoRight: Strings.DISCOVER_CHALLENGE_PHOTO_RIGHT1,
        numberOfChallenge: "5.8M",
        category: S.current.trending),
    DiscoverChallengeModule(
        challengeName: S.current.dogPortrait,
        isSponsorEvent: false,
        challengePhotoLeft: Strings.DISCOVER_CHALLENGE_PHOTO_LEFT2,
        challengePhotoRight: Strings.DISCOVER_CHALLENGE_PHOTO_RIGHT2,
        numberOfChallenge: "10K",
        category: S.current.trending),
  ];
}
