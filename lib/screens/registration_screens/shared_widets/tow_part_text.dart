import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TowPartText extends StatelessWidget {
  final String normalText;
  final String clickableText;
  final Function onClickText;
  final EdgeInsetsGeometry? padding;
  final String? heroTag;

  TowPartText({
    required this.clickableText,
    required this.normalText,
    required this.onClickText,
    this.padding,
    this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag ?? Strings.T_DO_NOT_HAVE_ACCOUNT_TAG,
      child: Container(
        width: 100.w,
        padding: padding,
        alignment: Alignment.center,
        child: buildTheText(context),
      ),
    );
  }

  RichText buildTheText(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: AppColors.textSkipColor,
          fontSize: LocalHelper.getFontSize(12),
          fontFamily: Strings.C_ARIAL,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
        ),
        children: <TextSpan>[
          TextSpan(
            text: normalText,
            style: TextStyle(
              fontFamily: Strings.C_ARIAL,
              fontSize: LocalHelper.getFontSize(12),
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              color: AppColors.textPrimaryColor,
            ),
          ),
          TextSpan(
            text: clickableText,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                onClickText();
              },
          ),
        ],
      ),
    );
  }
}
