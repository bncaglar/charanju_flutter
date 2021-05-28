import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/screens/registration_screens/creating_profile/enter_email_screen/enter_email_screen.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/or_text.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/return_to_text.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/social_media_row.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/test_logo.dart';
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
    Navigator.pushNamed(context, EnterEmailScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundPrimaryColor,
        body: buildSignInBody(context),
      ),
    );
  }

  Container buildSignInBody(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextLogo(),
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
      navigationButtonText: S.of(context).signIn,
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
}
