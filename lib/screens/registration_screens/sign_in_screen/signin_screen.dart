import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/or_text.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/return_to_text.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/social_media_row.dart';
import 'package:charanju_flutter/screens/registration_screens/sign_in_screen/remember_me_row.dart';
import 'package:charanju_flutter/screens/registration_screens/sign_in_screen/signin_form.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/navigation_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/SignInScreen';

  SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final log = Logger();

  onClickNavigatorButton() {
    log.i("onClickNavigatorButton started");
  }

  onClickHighlightedText() {
    log.i("onClickHighlightedText started");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimaryColor,
      body: buildSignInBody(context),
    );
  }

  Container buildSignInBody(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildTextLogo(),
          buildReadyText(context),
          SignInForm(),
          RememberMeRow(),
          buildSignInNtb(),
          OrText(),
          SocialMediaRow(),
          buildDoYouHaveAccount(context),
        ],
      ),
    );
  }

  TowPartText buildDoYouHaveAccount(BuildContext context) {
    return TowPartText(
      highlightedText: S.of(context).signUp,
      normalText: S.of(context).doYouHaveAccount,
      onClickHighlightedText: onClickHighlightedText,
    );
  }

  NavigationButton buildSignInNtb() {
    return NavigationButton(
      navigationButtonText: "SignIn",
      onClickNavigatorButton: onClickNavigatorButton,
      margin: EdgeInsets.only(
        left: 4.69.w,
        right: 4.69.w,
        top: 4.35.h,
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

  Hero buildTextLogo() {
    return Hero(
      tag: Strings.SCREENS_TEXT_LOGO_TAG,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          top: 14.31.h,
          left: 29.83.w,
          right: 30.11.w,
        ),
        child: Image.asset(
          Strings.SCREENS_TEXT_LOGO_PNG,
        ),
      ),
    );
  }
}
