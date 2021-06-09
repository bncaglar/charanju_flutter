import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/logic/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:charanju_flutter/screens/registration_screens/sign_in_screen/signin_screen.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/form/password_field.dart';
import 'package:charanju_flutter/widgets/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterNewPasswordScreen extends StatefulWidget {
  EnterNewPasswordScreen({Key? key}) : super(key: key);

  @override
  _EnterNewPasswordScreenState createState() => _EnterNewPasswordScreenState();
}

class _EnterNewPasswordScreenState extends State<EnterNewPasswordScreen> {
  TextEditingController confirmPasswordController = TextEditingController();
  final _passwordKey = GlobalKey<FormState>();
  TextEditingController newPasswordController = TextEditingController();
  final log = Logger();

  onClickConfirmPassword() {
    log.i("onClickConfirmPassword started");

    if (_passwordKey.currentState!.validate()) {
      Navigator.of(context).pushNamed(SignInScreen.routeName);
      context.read<ForgetPasswordCubit>().changeStep(ForgetPasswordEmailStep());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildPasswordField(),
          buildPadding(),
          buildMustConsistText(context),
          buildConfirmPasswordNtb()
        ],
      ),
    );
  }

  SizedBox buildPadding() {
    return SizedBox(
      height: 3.57.h,
    );
  }

  Container buildPasswordField() {
    return Container(
      child: Form(
        key: _passwordKey,
        child: Column(
          children: [
            newPasswordField(),
            confirmPasswordField(),
          ],
        ),
      ),
    );
  }

  Container newPasswordField() {
    return Container(
      padding: EdgeInsets.only(left: 4.69.w, right: 4.69.w, top: 11.95.h),
      child: Hero(
        tag: Strings.EMAIL_FIELD_TAG,
        child: PasswordField(
          confirmPasswordController: confirmPasswordController,
          controller: newPasswordController,
          labelText: S.of(context).newPassword,
          passwordServerError:
              null, //todo send the server error here after implement the API
        ),
      ),
    );
  }

  Container confirmPasswordField() {
    return Container(
      padding: EdgeInsets.only(left: 4.70.w, right: 4.69.w, bottom: 1.56.h),
      child: Hero(
        tag: Strings.EMAIL_FIELD_TAG,
        child: PasswordField(
          controller: confirmPasswordController,
          confirmPasswordController: newPasswordController,
          labelText: S.of(context).confirmPassword,
          passwordServerError:
              null, //todo send the server error here after implement the API
        ),
      ),
    );
  }

  Row buildMustConsistText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 5.62.h,
          padding: EdgeInsets.only(left: 5.27.w),
          child: AutoSizeText(
            S.of(context).passwordMustContain,
            style: TextStyle(
              color: AppColors.textPrimaryColor,
              fontSize: LocalHelper.getFontSize(12),
            ),
            maxLines: 2,
            minFontSize: 12,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  NavigationButton buildConfirmPasswordNtb() {
    return NavigationButton(
      navigationButtonText: S.of(context).confirmPassword,
      onClickNavigatorButton: onClickConfirmPassword,
      margin: EdgeInsets.only(
        left: 4.69.w,
        right: 4.69.w,
        top: 5.77.h,
      ),
    );
  }
}
