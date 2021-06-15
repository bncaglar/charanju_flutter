import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BetNumberText extends StatefulWidget {
  String betNumber;

  BetNumberText({required this.betNumber});

  @override
  _BetNumberTextState createState() => _BetNumberTextState();
}

class _BetNumberTextState extends State<BetNumberText> {
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      widget.betNumber + " bets",

      ///todo get bet number from API
      style: TextStyle(
        fontSize: LocalHelper.getFontSize(12),
        color: AppColors.primaryWightColor,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
