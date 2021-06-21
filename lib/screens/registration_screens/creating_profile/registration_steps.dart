import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/logic/cubit/create_profile_cubit/create_profile_cubit.dart';
import 'package:charanju_flutter/screens/registration_screens/creating_profile/add_profile_photo_and_complete_signup_screen/add_profile_photo_state_body.dart';
import 'package:charanju_flutter/screens/registration_screens/creating_profile/enter_birthday_screen.dart';
import 'package:charanju_flutter/screens/registration_screens/creating_profile/enter_email_screen.dart';
import 'package:charanju_flutter/screens/registration_screens/creating_profile/enter_password_screen.dart';
import 'package:charanju_flutter/screens/registration_screens/creating_profile/enter_user_name_screen.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/custom_app_bar.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/text_logo.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/tow_part_text.dart';
import 'package:charanju_flutter/screens/registration_screens/sign_in_screen/signin_screen.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/build_orientation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class RegistrationSteps extends StatefulWidget {
  static const routeName = '/RegistrationSteps';

  const RegistrationSteps({Key? key}) : super(key: key);

  @override
  _RegistrationStepsState createState() => _RegistrationStepsState();
}

class _RegistrationStepsState extends State<RegistrationSteps> {
  final log = Logger();

  onSignText() {
    log.i("onClickSignIn started");
    Navigator.of(context).pushNamed(SignInScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundPrimaryColor,
        body: BuildOrientation(
          landscape: buildRegistrationStepsBodyLandscape(context),
          portrait: buildRegistrationStepsBodyPortrait(context),
        ),
      ),
    );
  }

  Container buildRegistrationStepsBodyPortrait(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildCustomAppBarSteps(),
          buildTextLogoORImage(),
          buildFormSteps(),
          SizedBox(
            height: 9.52.h,
          ),
          buildAlreadyHaveAccountText(context),
        ],
      ),
    );
  }

  Container buildRegistrationStepsBodyLandscape(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildCustomAppBarSteps(),
            buildTextLogoORImage(),
            buildFormSteps(),
            SizedBox(
              height: 9.52.h,
            ),
            buildAlreadyHaveAccountText(context),
          ],
        ),
      ),
    );
  }

  TowPartText buildAlreadyHaveAccountText(BuildContext context) {
    return TowPartText(
      normalText: S.of(context).alreadyHaveAccount,
      clickableText: S.of(context).signIn,
      onClickText: onSignText,
    );
  }

  BlocBuilder<CreateProfileCubit, CreateProfileState> buildTextLogoORImage() {
    return BlocBuilder<CreateProfileCubit, CreateProfileState>(
      builder: (context, state) {
        if ((state is CreateProfileStepAddPhoto) ||
            (state is CreateProfileStepsCompleted)) {
          return AddProfilePhotoStep();
        }

        return Column(
          children: [
            TextLogo(
              padding: EdgeInsets.only(
                top: 3.67.h,
                left: 29.83.w,
                right: 30.11.w,
              ),
            ),
            buildReadyText(context),
          ],
        );
      },
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

  BlocBuilder buildCustomAppBarSteps() {
    return BlocBuilder<CreateProfileCubit, CreateProfileState>(
      builder: (context, state) {
        if (state is CreateProfileStepAddPhoto) {
          return CustomAppBar(
            title: S.of(context).addProfilePhoto,
            bottomPadding: 9.05.h,
            fromRegistration: true,
          );
        } else if (state is CreateProfileStepsCompleted) {
          return CustomAppBar(
            title: S.of(context).completeSignUp,
            bottomPadding: 9.05.h,
            fromRegistration: true,
          );
        }
        return CustomAppBar(
          title: S.of(context).createYourProfile,
          bottomPadding: 0,
          fromRegistration: true,
        );
      },
    );
  }

  BlocBuilder<CreateProfileCubit, CreateProfileState> buildFormSteps() {
    return BlocBuilder<CreateProfileCubit, CreateProfileState>(
      builder: (context, state) {
        if (state is CreateProfileStepEnterEmail) {
          return EnterEmailScreen();
        }
        if (state is CreateProfileStepEnterPassword) {
          return EnterPasswordScreen();
        }
        if (state is CreateProfileStepEnterUserName) {
          return EnterUserNameScreen();
        }
        if (state is CreateProfileStepEnterBirthday) {
          return EnterBirthdayScreen();
        }
        return Container();
      },
    );
  }
}
