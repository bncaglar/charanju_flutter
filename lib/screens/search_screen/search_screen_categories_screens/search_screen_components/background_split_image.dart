import 'package:charanju_flutter/helper/modules/discover_challenges_module.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../search_screen_data.dart';

class OneBackgroundChallengeSplitImage extends StatefulWidget {
  final String? challengePhotoLeft;
  final String? challengePhotoRight;
  final double? photoHeight;
  final double? photoWidth;

  OneBackgroundChallengeSplitImage(
      {required this.challengePhotoRight,
      required this.challengePhotoLeft,
      this.photoHeight,
      this.photoWidth});

  @override
  _OneBackgroundChallengeSplitImageState createState() =>
      _OneBackgroundChallengeSplitImageState();
}

class _OneBackgroundChallengeSplitImageState
    extends State<OneBackgroundChallengeSplitImage> {
  List<DiscoverChallengeModule> discoverChallenges =
      List.of(SearchScreenData.screenData);

  @override
  Widget build(BuildContext context) {
    return backgroundImage();
  }

  Row backgroundImage() {
    return Row(
      children: [backgroundLeftImage(), straightLine(), backgroundRightImage()],
    );
  }

  Container backgroundLeftImage() {
    return Container(
      height: widget.photoHeight ?? 16.71.h,
      width: widget.photoWidth ?? 16.66.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(widget.challengePhotoLeft!),
        ),
      ),
    );
  }

  Container straightLine() {
    return Container(
      width: 1,
      height: widget.photoHeight ?? 16.71.h,
      color: AppColors.primaryWightColor,
    );
  }

  Container backgroundRightImage() {
    return Container(
      height: widget.photoHeight ?? 16.71.h,
      width: widget.photoWidth ?? 16.66.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(widget.challengePhotoRight!),
        ),
      ),
    );
  }
}
