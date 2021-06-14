import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/logic/cubit/create_profile_cubit/create_profile_cubit.dart';
import 'package:charanju_flutter/screens/home_screens/main_home_screen.dart';
import 'package:charanju_flutter/screens/registration_screens/creating_profile/registration_steps.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/or_text.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/social_media_row.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/test_logo.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/tow_part_text.dart';
import 'package:charanju_flutter/screens/registration_screens/sign_in_screen/remember_me_row.dart';
import 'package:charanju_flutter/screens/registration_screens/sign_in_screen/signin_form.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/build_orientation.dart';
import 'package:charanju_flutter/widgets/navigation_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    context.read<CreateProfileCubit>().emit(CreateProfileStepEnterEmail());
    Navigator.pushNamed(context, RegistrationSteps.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundPrimaryColor,
        body: BuildOrientation(
          landscape: buildSignInBodyLandscape(context),
          portrait: buildSignInBodyPortrait(context),
        ),
      ),
    );
  }

  Container buildSignInBodyPortrait(BuildContext context) {
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

  Container buildSignInBodyLandscape(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
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
      ),
    );
  }

  TowPartText buildDoYouHaveAccount(BuildContext context) {
    return TowPartText(
      clickableText: S
          .of(context)
          .signUp,
      onClickText: onClickHighlightedText,
      normalText: S
          .of(context)
          .doYouHaveAccount,
      padding: EdgeInsets.only(
        top: 5.363.h,
      ),
    );
  }

  NavigationButton buildSignInNtb() {
    return NavigationButton(
      navigationButtonText: S
          .of(context)
          .signIn,
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
      S
          .of(context)
          .readySetChallenge,
      style: TextStyle(
        color: AppColors.textPrimaryColor,
        fontSize: LocalHelper.getFontSize(12),
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}