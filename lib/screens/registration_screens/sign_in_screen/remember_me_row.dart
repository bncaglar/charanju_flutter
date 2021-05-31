import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/logger/simple_log_printer.dart';
import 'package:charanju_flutter/logic/cubit/remember_me_cubit.dart';
import 'package:charanju_flutter/screens/registration_screens/sign_in_screen/remember_me_box.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RememberMeRow extends StatefulWidget {
  const RememberMeRow({Key? key}) : super(key: key);

  @override
  _RememberMeRowState createState() => _RememberMeRowState();
}

class _RememberMeRowState extends State<RememberMeRow> {
  final log = getLogger();

  onClickRememberMe() {
    log.i("onClickRememberMe Started");
    context.read<RememberMeCubit>().toggleRememberMe(
        !context.read<RememberMeCubit>().isRememberMeChecked());
  }

  onClickForgetPassword() {
    log.i("onClickForgetPassword Started");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 4.69.w, right: 4.69.w, top: 5.123.h),
      child: Row(
        children: [
          TheCheckBox(rememberMeOnClick: onClickRememberMe),
          buildRememberMeText(context),
          Spacer(),
          buildForgetPasswordText(),
        ],
      ),
    );
  }

  InkWell buildForgetPasswordText() {
    return InkWell(
      onTap: onClickForgetPassword,
      child: Text(
        S.of(context).forgotPassword,
        style: TextStyle(
          fontSize: 12.sp,
          fontFamily: Strings.ARIAL,
          color: AppColors.textPrimaryColor,
        ),
      ),
    );
  }

  Container buildRememberMeText(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 3.04.w),
      child: Text(
        S.of(context).rememberMe,
        style: TextStyle(
          color: AppColors.textPrimaryColor,
          fontSize: 12.sp,
          fontFamily: Strings.ARIAL,
          fontWeight: FontWeight.normal,
        ),
        // Strings.REMEMBER_ME,
      ),
    );
  }
}
