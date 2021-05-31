import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/form/birthday_field.dart';
import 'package:charanju_flutter/widgets/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class EnterBirthdayScreen extends StatefulWidget {
  const EnterBirthdayScreen({Key? key}) : super(key: key);

  @override
  _EnterBirthdayScreenState createState() => _EnterBirthdayScreenState();
}

class _EnterBirthdayScreenState extends State<EnterBirthdayScreen> {
  TextEditingController birthdayController = TextEditingController();
  final _birthdayKey = GlobalKey<FormState>();
  final log = Logger();

  onClickContinue() {
    log.i("onClickContinue Started");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildBirthdayField(),
          buildChooseBirthdayText(context),
          buildContinueNtb(),
        ],
      ),
    );
  }

  Container buildChooseBirthdayText(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 4.69.w,
        right: 4.69.w,
        top: 0.1555.h,
      ),
      child: AutoSizeText(
        S.of(context).textUnderBirthdayField,
        style: TextStyle(
          color: AppColors.textPrimaryColor,
          fontSize: 12.sp,
        ),
        maxLines: 2,
        minFontSize: 12,
        textAlign: TextAlign.center,
      ),
    );
  }

  Container buildBirthdayField() {
    return Container(
      padding: EdgeInsets.only(
          left: 4.69.w, right: 4.69.w, top: 17.197.h, bottom: 2.95.h),
      child: Form(
        key: _birthdayKey,
        child: Hero(
          tag: Strings.EMAIL_FIELD_TAG,
          child: BirthdayField(
            controller: birthdayController,
            serverBirthdayErrorText:
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
