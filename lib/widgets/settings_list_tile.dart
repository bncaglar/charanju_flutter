import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SettingsListTile extends StatelessWidget {
  final String leading;
  final String? info;
  final Function onTap;

  SettingsListTile({
    required this.leading,
    required this.onTap,
    this.info,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: titleText(),
      trailing: trailingRow(),
      onTap: () {
        onTap();
      },
    );
  }

  AutoSizeText titleText() {
    return AutoSizeText(
      leading,
      style: TextStyle(
        color: AppColors.primaryWightColor,
        fontSize: LocalHelper.getFontSize(15),
        fontFamily: Strings.C_ARIAL,
        fontWeight: FontWeight.w400,
      ),
      maxLines: 2,
      minFontSize: 15,
      textAlign: TextAlign.center,
    );
  }

  Widget trailingRow() {
    if (info == null) {
      return Icon(
        Icons.arrow_forward_ios,
        color: AppColors.forthGrayColor,
        size: LocalHelper.getFontSize(17),
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AutoSizeText(
          info!,
          style: TextStyle(
            color: AppColors.transparentGrayColor,
            fontSize: LocalHelper.getFontSize(12),
            fontWeight: FontWeight.w700,
            fontFamily: Strings.C_ARIAL,
          ),
          maxLines: 2,
          minFontSize: 12,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: EdgeInsets.only(left: 5.8.w),
          child: Icon(
            Icons.arrow_forward_ios,
            color: AppColors.forthGrayColor,
            size: LocalHelper.getFontSize(17),
          ),
        ),
      ],
    );
  }
}
