import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/logic/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/form/email_field.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:charanju_flutter/widgets/navigation_button.dart';

class EnterEmailForgetPassword extends StatefulWidget {
  EnterEmailForgetPassword({Key? key}) : super(key: key);

  @override
  _EnterEmailForgetPasswordState createState() =>
      _EnterEmailForgetPasswordState();
}

class _EnterEmailForgetPasswordState extends State<EnterEmailForgetPassword> {
  TextEditingController emailController = TextEditingController();
  final _emailKey = GlobalKey<FormState>();
  final log = Logger();

  onClickContinue() {
    log.i("onClickContinue Started");
    if (_emailKey.currentState!.validate()) {
      context
          .read<ForgetPasswordCubit>()
          .changeStep(CreateForgetPasswordEnterCode());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildEmailField(),
          buildWeWillSendCodeText(context),
          buildContinueNtb()
        ],
      ),
    );
  }

  Container buildEmailField() {
    return Container(
      padding: EdgeInsets.only(
          left: 4.69.w, right: 4.69.w, top: 21.95.h, bottom: 2.96.h),
      child: Form(
        key: _emailKey,
        child: Hero(
          tag: Strings.EMAIL_FIELD_TAG,
          child: EmailField(
            controller: emailController,
            serverEmailErrorText:
                null, //todo send the server error here after implement the API
          ),
        ),
      ),
    );
  }

  Container buildWeWillSendCodeText(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 4.69.w,
        right: 4.69.w,
        top: 0.1555.h,
      ),
      child: AutoSizeText(
        S.of(context).weWillSendCode,
        style: TextStyle(
          color: AppColors.textPrimaryColor,
          fontSize: LocalHelper.getFontSize(12),
        ),
        maxLines: 2,
        minFontSize: 12,
        textAlign: TextAlign.center,
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
        top: 5.754.h,
      ),
    );
  }
}
