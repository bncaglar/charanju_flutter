import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/logic/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:charanju_flutter/screens/registration_screens/shared_widets/tow_part_text.dart';
import 'package:charanju_flutter/widgets/form/enter_code_field.dart';
import 'package:charanju_flutter/widgets/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterCodeForgetPassword extends StatefulWidget {
  EnterCodeForgetPassword({Key? key}) : super(key: key);

  @override
  _EnterCodeForgetPasswordState createState() =>
      _EnterCodeForgetPasswordState();
}

class _EnterCodeForgetPasswordState extends State<EnterCodeForgetPassword> {
  TextEditingController codeController = TextEditingController();
  final _codeKey = GlobalKey<FormState>();
  final log = Logger();

  onClickContinue() {
    log.i("onClickContinue Started");
    if (_codeKey.currentState!.validate()) {
      context
          .read<ForgetPasswordCubit>()
          .changeStep(CreateForgetPasswordEnterNewPassword());
    }
  }

  onClickResendCode() {
    log.i("onClickResendCode started");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildCodeField(),
          resendCodeText(),
          buildContinueNtb(),
        ],
      ),
    );
  }

  Container buildCodeField() {
    return Container(
      padding: EdgeInsets.only(
          left: 4.69.w, right: 4.69.w, top: 22.26.h, bottom: 3.27.h),
      child: Form(
        key: _codeKey,
        child: Hero(
          tag: Strings.EMAIL_FIELD_TAG,
          child: EnterCodeField(
            //validator should be fixed
            controller: codeController,
            serverCodeErrorText:
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
        top: 8.58.h,
      ),
    );
  }

  TowPartText resendCodeText() {
    return TowPartText(
        normalText: S.of(context).receiveCode,
        clickableText: S.of(context).resendCodeText,
        onClickText: onClickResendCode);
  }
}
