import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  final log = Logger();

  onClickSignIn() {
    log.i("onClickSignIn started");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).alreadyHaveAccount,
          style: TextStyle(
            color: AppColors.textPrimaryColor,
            fontSize: LocalHelper.getFontSize(12).sp,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
          ),
        ),
        InkWell(
          onTap: () {
            onClickSignIn();
          },
          child: Text(
            S.of(context).signIn,
            style: TextStyle(
              color: AppColors.textSkipColor,
              fontSize: LocalHelper.getFontSize(12).sp,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
            ),
          ),
        )
      ],
    );
  }
}
