import 'package:charanju_flutter/helper/modules/discover_challenges_module.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'custom_auto_size_text.dart';

class NumberOfChallenge extends StatefulWidget {
  final DiscoverChallengeModule discoverChallenge;

  NumberOfChallenge({required this.discoverChallenge});

  @override
  _NumberOfChallengeState createState() => _NumberOfChallengeState();
}

class _NumberOfChallengeState extends State<NumberOfChallenge> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SearchScreenCustomAutoSizeText(
          content: widget.discoverChallenge.numberOfChallenge,
        ),
        SizedBox(width: 2.77.w),
        Icon(
          Icons.arrow_forward_ios_outlined,
          color: AppColors.primaryWightColor,
          size: 15,
        ),
      ],
    );
  }
}
