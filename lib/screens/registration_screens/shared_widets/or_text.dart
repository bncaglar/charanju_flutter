import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: Strings.T_OR_TAG,
      child: Container(
        padding: EdgeInsets.only(top: 2.488.h),
        child: Text(
          S.of(context).or,
          style: TextStyle(
            fontFamily: Strings.C_ARIAL,
            fontSize: LocalHelper.getFontSize(12),
            fontStyle: FontStyle.normal,
            color: AppColors.textPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
