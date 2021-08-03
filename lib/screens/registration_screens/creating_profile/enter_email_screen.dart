import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/logic/cubit/create_profile_cubit/create_profile_cubit.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/form/email_field.dart';
import 'package:charanju_flutter/widgets/navigation_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterEmailScreen extends StatefulWidget {
  EnterEmailScreen({Key? key}) : super(key: key);

  @override
  _EnterEmailScreenState createState() => _EnterEmailScreenState();
}

class _EnterEmailScreenState extends State<EnterEmailScreen> {
  TextEditingController emailController = TextEditingController();
  final _emailKey = GlobalKey<FormState>();
  final log = Logger();

  onClickContinue() {
    log.i("onClickContinue Started");
    if (_emailKey.currentState!.validate()) {
      context
          .read<CreateProfileCubit>()
          .changeStep(CreateProfileStepEnterPassword());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildEmailField(),
          buildWeWillUseText(context),
          buildContinueNtb(),
        ],
      ),
    );
  }

  Container buildWeWillUseText(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 4.69.w,
        right: 4.69.w,
        top: 0.1555.h,
      ),
      child: AutoSizeText(
        S.of(context).weWillUseThisToSignYou,
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

  Container buildEmailField() {
    return Container(
      padding: EdgeInsets.only(
          left: 4.69.w, right: 4.69.w, top: 17.197.h, bottom: 2.95.h),
      child: Form(
        key: _emailKey,
        child: Hero(
          tag: Strings.T_EMAIL_FIELD_TAG,
          child: EmailField(
            controller: emailController,
            serverEmailErrorText:
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
        top: 5.754.h,
      ),
    );
  }
}
