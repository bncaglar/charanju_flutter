import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/test_logo.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/form/email_field.dart';
import 'package:charanju_flutter/widgets/navigation_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class EnterEmailScreen extends StatefulWidget {
  static const routeName = '/EnterEmailScreen';

  EnterEmailScreen({Key? key}) : super(key: key);

  @override
  _EnterEmailScreenState createState() => _EnterEmailScreenState();
}

class _EnterEmailScreenState extends State<EnterEmailScreen> {
  TextEditingController emailController = TextEditingController();
  final _emailKey = GlobalKey<FormState>();
  final log = Logger();

  onClickBackBtn() {
    log.i("onClickBackBtn Started");
    Navigator.pop(context);
  }

  onClickContinue() {
    log.i("onClickContinue Started");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundPrimaryColor,
        body: buildEnterEmailBody(context),
      ),
    );
  }

  Container buildEnterEmailBody(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildCustomAppBar(context),
          buildTextLogo(),
          buildReadyText(context),
          buildEmailField(),
          buildWeWillUseText(context),
          buildContinueNtb(),
        ],
      ),
    );
  }

  Container buildWeWillUseText(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 4.69.w,
        right: 4.69.w,
        top: 0.1555.h,
      ),
      child: AutoSizeText(
        S.of(context).weWillUseThisToSignYou,
        style: TextStyle(
          color: AppColors.textPrimaryColor,
          fontSize: 12.sp,
        ),
        maxLines: 2,
        minFontSize: 12,
        textAlign: TextAlign.center,
      ),
    );
  }

  Container buildCustomAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 5.449.w,
        right: 5.449.w,
        top: 1.244.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildBackBtn(),
          Spacer(),
          buildTitle(context),
          Spacer(),
          Placeholder(
            fallbackWidth: 24.0,
            strokeWidth: 24.0,
            fallbackHeight: 24.0,
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }

  Container buildTitle(BuildContext context) {
    return Container(
        width: 44.25.w,
        child: AutoSizeText(
          S.of(context).createYourProfile,
          style: TextStyle(
            fontSize: 15.sp,
            color: AppColors.primaryWightColor,
            fontWeight: FontWeight.w400,
            fontFamily: Strings.ARIAL,
          ),
          minFontSize: 12,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ));
  }

  IconButton buildBackBtn() {
    return IconButton(
      onPressed: onClickBackBtn,
      icon: Icon(
        Icons.arrow_back_ios,
        color: AppColors.primaryWightColor,
        size: 17.sp,
      ),
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
        fontSize: 12.sp,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Container buildEmailField() {
    return Container(
      padding: EdgeInsets.only(left: 4.69.w, right: 4.69.w, top: 17.197.h),
      child: Form(
        key: _emailKey,
        child: Hero(
          tag: Strings.EMAIL_FIELD_TAG,
          child: EmailField(
            controller: emailController,
            serverEmailErrorText:
                null, //todo send the server error here after implement the API
          ),
        ),
      ),
    );
  }

  NavigationButton buildContinueNtb() {
    return NavigationButton(
      navigationButtonText: S.of(context).continueText,
      onClickNavigatorButton: onClickContinue,
      margin: EdgeInsets.only(
        left: 4.69.w,
        right: 4.69.w,
        top: 5.754.h,
      ),
    );
  }
}
