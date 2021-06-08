import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/logic/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/form/password_field.dart';
import 'package:charanju_flutter/widgets/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterNewPassword extends StatefulWidget {
  EnterNewPassword({Key? key}) : super(key: key);

  @override
  _EnterNewPasswordState createState() => _EnterNewPasswordState();
}

class _EnterNewPasswordState extends State<EnterNewPassword> {
  TextEditingController passwordController = TextEditingController();
  final _passwordKey = GlobalKey<FormState>();
  TextEditingController newPasswordController = TextEditingController();
  final _newPasswordKey = GlobalKey<FormState>();
  final log = Logger();

  onClickConfirmPassword() {
    log.i("onClickConfirmPassword started");
    if (_passwordKey.currentState!.validate() &&
        passwordController.text == newPasswordController.text) {
      context
          .read<ForgetPasswordCubit>()
          .changeStep(CreateForgetPasswordTermsOfUse());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildPasswordField(),
          buildPadding(),
          buildNewPasswordField(),
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
      padding: EdgeInsets.only(left: 4.69.w, right: 4.69.w, top: 11.95.h),
      child: Form(
        key: _passwordKey,
        child: Hero(
          tag: Strings.PASSWORD_FIELD_TAG,
          child: PasswordField(
            controller: passwordController,
            labelText: S.of(context).newPassword,
            passwordServerError:
                null, //todo send the server error here after implement the API
          ),
        ),
      ),
    );
  }

  Container buildNewPasswordField() {
    return Container(
      padding: EdgeInsets.only(left: 4.70.w, right: 4.69.w, bottom: 1.56.h),
      child: Form(
        key: _newPasswordKey,
        child: Hero(
          tag: Strings.PASSWORD_FIELD_TAG,
          child: PasswordField(
            controller: newPasswordController,
            labelText: S.of(context).confirmPassword,
            passwordServerError:
                null, //todo send the server error here after implement the API
          ),
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
