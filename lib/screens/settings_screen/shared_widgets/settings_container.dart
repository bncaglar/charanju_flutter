import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/screens/settings_screen/shared_widgets/settings_list_tile.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SettingsContainer extends StatelessWidget {
  final String header;
  final List<SettingsListTile> itemList;
  SettingsContainer({
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
          contentListView(),
        ],
      ),
    );
  }

  Container contentListView() {
    return Container(
      height: itemList.length * 5.h,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemList.length,
        padding: EdgeInsets.zero,
        itemExtent: 4.7.h,
        itemBuilder: (BuildContext context, int index) {
          return itemList[index];
        },
      ),
    );
  }

  AutoSizeText headerText() {
    return AutoSizeText(
      header,
      style: TextStyle(
        color: AppColors.transparentGrayColor,
        fontSize: LocalHelper.getFontSize(12),
      ),
      maxLines: 2,
      minFontSize: 12,
      textAlign: TextAlign.center,
    );
  }
}
