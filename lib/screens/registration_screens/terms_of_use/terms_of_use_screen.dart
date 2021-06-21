import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/widgets/build_orientation.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/custom_app_bar.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/text_logo.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class TermsOfUseScreen extends StatefulWidget {
  static const routeName = '/TermsOfUseScreen';

  TermsOfUseScreen({Key? key}) : super(key: key);

  @override
  _TermsOfUseScreenState createState() => _TermsOfUseScreenState();
}

class _TermsOfUseScreenState extends State<TermsOfUseScreen> {
  final log = Logger();

  onClickAgree() {
    log.i("onClickAgree started");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundPrimaryColor,
        body: Container(
          child: BuildOrientation(
            landscape: buildBodyLandscape(),
            portrait: buildBodyPortrait(),
          ),
        ),
      ),
    );
  }

  Column buildBodyPortrait() {
    return Column(
      children: [
        buildCustomAppBar(),
        buildTextLogo(),
        buildReadyText(context),
        termsOfUseText(),
        termsOfUseTextLong(),
        termsOfUseTextLongP1(),
        buildContinueNtb(),
      ],
    );
  }

  SingleChildScrollView buildBodyLandscape() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildCustomAppBar(),
          buildTextLogo(),
          buildReadyText(context),
          termsOfUseText(),
          termsOfUseTextLong(),
          termsOfUseTextLongP1(),
          buildContinueNtb(),
        ],
      ),
    );
  }

  CustomAppBar buildCustomAppBar() {
    return CustomAppBar(
      title: S.of(context).terms,
      bottomPadding: 0,
    );
  }

  TextLogo buildTextLogo() {
    return TextLogo(
      padding: EdgeInsets.only(
        top: 3.67.h,
        left: 29.83.w,
        right: 30.11.w,
      ),
    );
  }

  Text buildReadyText(BuildContext context) {
    return Text(
      S.of(context).readySetChallenge,
      style: TextStyle(
        color: AppColors.textPrimaryColor,
        fontSize: LocalHelper.getFontSize(12).sp,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
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
          paragraph3(),
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
