import 'package:charanju_flutter/logger/simple_log_printer.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OneBackgroundChallengeSplitImage extends StatefulWidget {
  final String? challengePhotoLeft;
  final String? challengePhotoRight;

  OneBackgroundChallengeSplitImage(
      {required this.challengePhotoRight, required this.challengePhotoLeft});

  @override
  _OneBackgroundChallengeSplitImageState createState() =>
      _OneBackgroundChallengeSplitImageState();
}

class _OneBackgroundChallengeSplitImageState
    extends State<OneBackgroundChallengeSplitImage> {
  final log = getLogger();

  onTapImage() {
    log.i("onTapImage Started");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          right: 2.22.w,
        ),
        child: backgroundImage());
  }

  GestureDetector backgroundImage() {
    return GestureDetector(
      onTap: onTapImage,
      child: Row(
        children: [
          backgroundLeftImage(),
          straightLine(),
          backgroundRightImage(),
        ],
      ),
    );
  }

  Container backgroundLeftImage() {
    return Container(
      height: 16.71.h,
      width: 16.66.w,
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
      height: 16.71.h,
      color: AppColors.primaryWightColor,
    );
  }

  Container backgroundRightImage() {
    return Container(
      height: 16.71.h,
      width: 16.66.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(widget.challengePhotoRight!),
        ),
      ),
    );
  }
}
