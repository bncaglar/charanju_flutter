import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/logic/cubit/create_profile_cubit/create_profile_cubit.dart';
import 'package:charanju_flutter/screens/registration_screens/creating_profile/enter_birthday_screen.dart';
import 'package:charanju_flutter/screens/registration_screens/creating_profile/enter_email_screen.dart';
import 'package:charanju_flutter/screens/registration_screens/creating_profile/enter_password_screen.dart';
import 'package:charanju_flutter/screens/registration_screens/creating_profile/enter_user_name_screen.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/test_logo.dart';
import 'package:charanju_flutter/utilities/colors.dart';
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

  onClickBackBtn() {
    log.i("onClickBackBtn Started");
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundPrimaryColor,
        body: buildRegistrationStepsBody(context),
      ),
    );
  }

  Container buildRegistrationStepsBody(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildCustomAppBar(context),
          buildTextLogo(),
          buildReadyText(context),
          buildFormSteps(),
        ],
      ),
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
    });
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
}
