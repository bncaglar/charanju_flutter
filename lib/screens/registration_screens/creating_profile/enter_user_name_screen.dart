import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/logic/cubit/create_profile_cubit/create_profile_cubit.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/form/user_name_field.dart';
import 'package:charanju_flutter/widgets/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterUserNameScreen extends StatefulWidget {
  const EnterUserNameScreen({Key? key}) : super(key: key);

  @override
  _EnterUserNameScreenState createState() => _EnterUserNameScreenState();
}

class _EnterUserNameScreenState extends State<EnterUserNameScreen> {
  TextEditingController userNameController = TextEditingController();
  final _userNameKey = GlobalKey<FormState>();
  final log = Logger();

  onClickContinue() {
    log.i("onClickContinue Started");
    if (_userNameKey.currentState!.validate()) {
      context
          .read<CreateProfileCubit>()
          .changeStep(CreateProfileStepEnterBirthday());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildUserNameField(),
          buildChooseUserNameText(context),
          buildContinueNtb(),
        ],
      ),
    );
  }

  Container buildChooseUserNameText(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 4.69.w,
        right: 4.69.w,
        top: 0.1555.h,
      ),
      child: AutoSizeText(
        S.of(context).textUnderUserNameField,
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

  Container buildUserNameField() {
    return Container(
      padding: EdgeInsets.only(
          left: 4.69.w, right: 4.69.w, top: 17.197.h, bottom: 2.95.h),
      child: Form(
        key: _userNameKey,
        child: Hero(
          tag: Strings.EMAIL_FIELD_TAG,
          child: UserNameField(
            controller: userNameController,
            serverUserNameErrorText:
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
