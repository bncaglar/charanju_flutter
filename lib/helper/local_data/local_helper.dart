import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

abstract class LocalHelper {
  static final log = Logger();

  static double getFontSize(double? fontSize) {
    fontSize = ((fontSize! * 30.0) / 35.0).sp;
    return fontSize;
  }

  static void showTheBottomSheet(
      {required BuildContext context, required Widget child}) {
    log.i("showTheBottomSheet started");

    final straightLine = Padding(
      padding: EdgeInsets.only(top: 2.19.h, left: 45.w, right: 43.8.w),
      child: Container(
        height: 1,
        width: 11.11.w,
        color: AppColors.primaryWightColor,
      ),
    );

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          height: 47.16.h,
          child: Column(
            children: [
              straightLine,
              child,
            ],
          ),
          decoration: BoxDecoration(
            color: AppColors.modalBottomSheetColor,
          ),
        );
      },
    );
  }
}
