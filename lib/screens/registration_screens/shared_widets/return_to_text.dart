import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TowPartText extends StatelessWidget {
  final Function onClickHighlightedText;
  final String normalText;
  final String highlightedText;
  final EdgeInsetsGeometry? padding;

  TowPartText({
    required this.onClickHighlightedText,
    required this.normalText,
    required this.highlightedText,
    this.padding,
  });
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: Strings.DO_NOT_HAVE_ACCOUNT_TAG,
      child: Container(
        width: 100.w,
        padding: padding ??
            EdgeInsets.only(
              top: 5.363.h,
            ),
        alignment: Alignment.center,
        child: buildTheText(context),
      ),
    );
  }

  RichText buildTheText(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: AppColors.primaryBlueColor,
          fontSize: 15.4.sp,
          fontFamily: Strings.ARIAL,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
        ),
        children: <TextSpan>[
          TextSpan(
            text: normalText,
            style: TextStyle(
              fontFamily: Strings.ARIAL,
              fontSize: 15.4.sp,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w200,
              color: AppColors.textPrimaryColor,
            ),
          ),
          TextSpan(
            text: highlightedText,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                onClickHighlightedText();
              },
          ),
        ],
      ),
    );
  }
}
