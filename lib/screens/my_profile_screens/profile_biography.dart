import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileBiography extends StatelessWidget {
  const ProfileBiography({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 0.78.h,
        left: 5.w,
        right: 8.3.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildBiographyText(context),
          buildBiographyContent(context),
        ],
      ),
    );
  }

  AutoSizeText buildBiographyContent(BuildContext context) {
    return AutoSizeText(
      //todo get biography content from API
      S.of(context).biographyLongText,
      style: TextStyle(
        color: AppColors.primaryWightColor,
        fontSize: LocalHelper.getFontSize(12),
      ),
      maxLines: 4,
      softWrap: true,
      minFontSize: 14,
      textAlign: TextAlign.left,
    );
  }

  AutoSizeText buildBiographyText(BuildContext context) {
    return AutoSizeText(
      //todo get biography content from API
      S.of(context).biography,
      style: TextStyle(
        color: AppColors.primaryWightColor,
        fontSize: LocalHelper.getFontSize(12),
        fontWeight: FontWeight.w400,
        fontFamily: Strings.C_ARIAL,
      ),
      maxLines: 1,
      minFontSize: 14,
      textAlign: TextAlign.left,
    );
  }
}
