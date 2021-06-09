import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/logic/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:charanju_flutter/screens/registration_screens/forget_password/enter_email_screen.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/custom_app_bar.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/test_logo.dart';
import 'package:charanju_flutter/screens/registration_screens/terms_of_use/terms_of_use_screen.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

import 'enter_code_screen.dart';
import 'enter_new_password.dart';

class ForgetPasswordSteps extends StatefulWidget {
  static const routeName = '/ForgetPasswordSteps';

  ForgetPasswordSteps({Key? key}) : super(key: key);

  @override
  _ForgetPasswordStepsState createState() => _ForgetPasswordStepsState();
}

class _ForgetPasswordStepsState extends State<ForgetPasswordSteps> {
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
      body: buildForgetPasswordStepBody(context),
    ));
  }

  Container buildForgetPasswordStepBody(BuildContext context) {
    return Container(
      child: Column(
        children: [
          customAppBar(),
          buildTextLogo(),
          buildReadyText(context),
          buildFormSteps()
        ],
      ),
    );
  }

  BlocBuilder<ForgetPasswordCubit, ForgetPasswordState> customAppBar() {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
        builder: (context, state) {
      if (state is CreateForgetPasswordEnterEmail) {
        return CustomAppBar(
          title: S.of(context).forgotPasswordText,
          bottomPadding: 0,
        );
      }
      if (state is CreateForgetPasswordEnterCode) {
        return CustomAppBar(
          title: S.of(context).forgotPasswordText,
          bottomPadding: 0,
        );
      }
      if (state is CreateForgetPasswordEnterNewPassword) {
        return CustomAppBar(
          title: S.of(context).forgotPasswordText,
          bottomPadding: 0,
        );
      }
      if (state is CreateForgetPasswordTermsOfUse) {
        return CustomAppBar(
          title: S.of(context).terms,
          bottomPadding: 0,
        );
      }
      return Container();
    });
  }

  BlocBuilder<ForgetPasswordCubit, ForgetPasswordState> buildFormSteps() {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
        builder: (context, state) {
      if (state is CreateForgetPasswordEnterEmail) {
        return EnterEmailForgetPassword();
      }
      if (state is CreateForgetPasswordEnterCode) {
        return EnterCodeForgetPassword();
      }
      if (state is CreateForgetPasswordEnterNewPassword) {
        return EnterNewPassword();
      }
      if (state is CreateForgetPasswordTermsOfUse) {
        return TermsOfUseScreen();
      }
      return Container();
    });
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
}
