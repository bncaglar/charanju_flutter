import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SettingsDivider extends StatelessWidget {
  final double? leftPadding;
  final double? rightPadding;
  const SettingsDivider({
    Key? key,
    this.leftPadding,
    this.rightPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.transparentGrayColor,
      thickness: 1.sp,
      indent: leftPadding ?? 4.7.w,
      endIndent: rightPadding ?? 4.7.w,
    );
  }
}
