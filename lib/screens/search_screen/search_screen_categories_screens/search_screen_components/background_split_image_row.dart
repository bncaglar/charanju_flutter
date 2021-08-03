import 'package:flutter/material.dart';
import 'background_split_image.dart';

class BackgroundSplitImageRow extends StatefulWidget {
  final String? leftPhotoPath;
  final String? rightPhotoPath;
  final double? photoHeight;
  final double? photoWidth;

  BackgroundSplitImageRow(
      {required this.leftPhotoPath,
      required this.rightPhotoPath,
      this.photoWidth,
      this.photoHeight});

  @override
  _BackgroundSplitImageRowState createState() =>
      _BackgroundSplitImageRowState();
}

class _BackgroundSplitImageRowState extends State<BackgroundSplitImageRow> {
  @override
  Widget build(BuildContext context) {
    return backgroundSplitImageRow();
  }

  Widget backgroundSplitImageRow() {
    return Row(
      children: [
        OneBackgroundChallengeSplitImage(
            photoHeight: widget.photoHeight,
            photoWidth: widget.photoWidth,
            challengePhotoLeft: widget.leftPhotoPath!,
            challengePhotoRight: widget.rightPhotoPath!),
        OneBackgroundChallengeSplitImage(
            challengePhotoLeft: widget.leftPhotoPath!,
            challengePhotoRight: widget.rightPhotoPath!),
        OneBackgroundChallengeSplitImage(
            challengePhotoLeft: widget.leftPhotoPath!,
            challengePhotoRight: widget.rightPhotoPath!),
        OneBackgroundChallengeSplitImage(
            challengePhotoLeft: widget.leftPhotoPath!,
            challengePhotoRight: widget.rightPhotoPath!),
      ],
    );
  }
}
