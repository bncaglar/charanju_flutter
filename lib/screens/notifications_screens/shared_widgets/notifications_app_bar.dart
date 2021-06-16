import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class NotificationsAppBar extends StatefulWidget {
  @override
  _NotificationsAppBarState createState() => _NotificationsAppBarState();
}

class _NotificationsAppBarState extends State<NotificationsAppBar> {
  final log = Logger();

  onClickCommentIcon() {
    log.i("onClickCommentIcon started");
  }

  onClickDropDownIcon() {
    log.i("onClickDropDownIcon started");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [buildAppBar(context)],
      ),
    );
  }

  Container buildAppBar(BuildContext context) {
    return Container(
      height: 5.31.h,
      width: double.infinity,
      child: Row(
        children: [searchField(), commentIconSection()],
      ),
    );
  }

  Padding searchField() {
    return Padding(
      padding: EdgeInsets.only(left: 4.72.w),
      child: Container(
          height: 5.31.h,
          width: 81.38.w,
          color: AppColors.modalBottomSheetColor,
          child: searchFieldComponents()),
    );
  }

  Row searchFieldComponents() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [allNotificationsText(), dropDownSection()],
    );
  }

  Padding allNotificationsText() {
    return Padding(
      padding: EdgeInsets.only(top: 0.9375.h, bottom: 0.9375.h, left: 3.88.w),
      child: AutoSizeText(
        S.of(context).allNotifications,
        style: TextStyle(
          fontSize: LocalHelper.getFontSize(15),
          color: AppColors.allNotificationsTextColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Padding dropDownSection() {
    return Padding(
        padding: EdgeInsets.only(top: 0.781.h, bottom: 0.781.h, right: 1.94.w),
        child: dropDownIcon());
  }

  InkWell dropDownIcon() {
    return InkWell(
      onTap: () {
        onClickDropDownIcon();
      },
      child: Container(
          height: 3.75.h,
          width: 6.66.w,
          child: Image.asset(
            Strings.DROP_DOWN_ICON,
          )),
    );
  }

  Padding commentIconSection() {
    return Padding(
        padding: EdgeInsets.only(
          top: 0.625.h,
          bottom: 0.9375.h,
          left: 3.33.w,
          right: 3.88.w,
        ),
        child: commentIcon());
  }

  InkWell commentIcon() {
    return InkWell(
      onTap: () {
        onClickCommentIcon();
      },
      child: Container(
          height: 3.75.h,
          width: 6.66.w,
          child: Image.asset(
            Strings.COMMENT_ICON,
          )),
    );
  }
}
