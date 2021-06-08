import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class TermsOfUse extends StatefulWidget {
  TermsOfUse({Key? key}) : super(key: key);

  @override
  _TermsOfUseState createState() => _TermsOfUseState();
}

class _TermsOfUseState extends State<TermsOfUse> {
  final log = Logger();

  onClickAgree() {
    log.i("onClickAgree started");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          termsOfUseText(),
          termsOfUseTextLong(),
          termsOfUseTextLongP1(),
          buildContinueNtb(),
        ],
      ),
    );
  }

  Container termsOfUseText() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 6.181.h, left: 4.72.w),
      child: AutoSizeText(
        S.of(context).termsOfUse,
        style: TextStyle(
          color: AppColors.primaryWightColor,
          fontSize: LocalHelper.getFontSize(15),
        ),
        maxLines: 2,
        minFontSize: 12,
        textAlign: TextAlign.left,
      ),
    );
  }

  Container termsOfUseTextLong() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 2.81.h, left: 4.72.w),
      child: AutoSizeText(
        S.of(context).termsOfUseLongText,
        style: TextStyle(
            color: AppColors.textPrimaryColor,
            fontSize: LocalHelper.getFontSize(12),
            fontWeight: FontWeight.w400),
        minFontSize: 12,
        textAlign: TextAlign.left,
      ),
    );
  }

  Container termsOfUseTextLongP1() {
    return Container(
      child: Column(
        children: [
          paragraph1(),
          paragraph2(),
          paragraph3()
        ],
      ),
    );
  }

  Container paragraph1() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 3.10.h, left: 7.72.w),
      child: AutoSizeText(
        S.of(context).paragraph1,
        style: TextStyle(
            color: AppColors.textPrimaryColor,
            fontSize: LocalHelper.getFontSize(12),
            fontWeight: FontWeight.w400),
        minFontSize: 12,
        textAlign: TextAlign.left,
      ),
    );
  }

  Container paragraph2() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 0.5.h, left: 7.72.w),
      child: AutoSizeText(
        S.of(context).paragraph2,
        style: TextStyle(
            color: AppColors.textPrimaryColor,
            fontSize: LocalHelper.getFontSize(12),
            fontWeight: FontWeight.w400),
        minFontSize: 12,
        textAlign: TextAlign.left,
      ),
    );
  }

  Container paragraph3() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 0.5.h, left: 7.72.w),
      child: AutoSizeText(
        S.of(context).paragraph3,
        style: TextStyle(
            color: AppColors.textPrimaryColor,
            fontSize: LocalHelper.getFontSize(12),
            fontWeight: FontWeight.w400),
        minFontSize: 12,
        textAlign: TextAlign.left,
      ),
    );
  }

  NavigationButton buildContinueNtb() {
    return NavigationButton(
      navigationButtonText: S.of(context).agree,
      onClickNavigatorButton: onClickAgree,
      margin: EdgeInsets.only(
        left: 4.69.w,
        right: 4.69.w,
        top: 3.754.h,
      ),
    );
  }
}
