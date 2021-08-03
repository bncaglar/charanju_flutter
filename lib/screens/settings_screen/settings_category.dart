import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/widgets/settings_list_tile.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SettingsCategory extends StatelessWidget {
  final String header;
  final List<SettingsListTile> itemList;

  SettingsCategory({
    required this.header,
    required this.itemList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.7.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerText(),
          contentList(),
        ],
      ),
    );
  }

  Column contentList() {
    return Column(
      children: [...itemList],
    );
  }

  AutoSizeText headerText() {
    return AutoSizeText(
      header,
      style: TextStyle(
        color: AppColors.transparentGrayColor,
        fontSize: LocalHelper.getFontSize(12),
        fontFamily: Strings.C_ARIAL,
        fontWeight: FontWeight.w700,
      ),
      maxLines: 2,
      minFontSize: 12,
      textAlign: TextAlign.center,
    );
  }
}
