import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class ChallengeName extends StatefulWidget {
  String challengeName;

  ChallengeName({required this.challengeName});

  @override
  _ChallengeNameState createState() => _ChallengeNameState();
}

class _ChallengeNameState extends State<ChallengeName> {
  final log = Logger();

  onClickChallengeName() {
    log.i("onClickChallengeName started");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: 5.78.h,
        ),
        child: challengeName());
  }

  InkWell challengeName() {
    return InkWell(
        onTap: () {
          onClickChallengeName();
        },
        child: challengeNameText());
  }

  AutoSizeText challengeNameText() {
    return AutoSizeText(
      "#" + widget.challengeName,

      ///todo challenge name will come from API
      style: TextStyle(
        fontSize: LocalHelper.getFontSize(15),
        color: AppColors.primaryWightColor,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
