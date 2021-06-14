import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/logic/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:charanju_flutter/screens/registration_screens/forget_password/enter_email_screen.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/custom_app_bar.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/text_logo.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/build_orientation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'enter_code_screen.dart';
import 'enter_new_password.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const routeName = '/ForgetPasswordScreen';

  ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundPrimaryColor,
        body: BuildOrientation(
          landscape: buildForgetPasswordBodyLandscape(context),
          portrait: buildForgetPasswordBodyPortrait(context),
        ),
      ),
    );
  }

  Container buildForgetPasswordBodyPortrait(BuildContext context) {
    return Container(
      child: Column(
        children: [
          forgetPasswordAppBar(),
          buildTextLogo(),
          buildReadyText(context),
          buildFormSteps()
        ],
      ),
    );
  }

  Container buildForgetPasswordBodyLandscape(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            forgetPasswordAppBar(),
            buildTextLogo(),
            buildReadyText(context),
            buildFormSteps()
          ],
        ),
      ),
    );
  }

  CustomAppBar forgetPasswordAppBar() {
    return CustomAppBar(
      title: S.of(context).forgotPasswordText,
      bottomPadding: 0,
      fromForgetPassword: true,
    );
  }

  BlocBuilder buildFormSteps() {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      builder: (context, state) {
        if (state is ForgetPasswordEmailStep) {
          return EnterEmailScreen();
        }
        if (state is ForgetPasswordCodeStep) {
          return EnterCodeScreen();
        }
        if (state is ForgetPasswordNewPasswordStep) {
          return EnterNewPasswordScreen();
        }
        return Container();
      },
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
}
