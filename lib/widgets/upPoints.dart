import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

///I don't know what this point is so refactoring might be required if you would like.
// ignore: must_be_immutable
class UpPoints extends StatefulWidget {
  String point;

  UpPoints({required this.point});

  @override
  _UpPointsState createState() => _UpPointsState();
}

class _UpPointsState extends State<UpPoints> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.78.h, left: 2.5.w),
      child: points(),
    );
  }

  AutoSizeText points() {
    return AutoSizeText(
      widget.point + "p",

      ///todo Points will come from API
      style: TextStyle(
        fontSize: LocalHelper.getFontSize(15),
        color: AppColors.primaryWightColor,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
