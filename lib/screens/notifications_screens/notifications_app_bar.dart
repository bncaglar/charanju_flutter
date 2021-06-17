import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/widgets/form/search_notification_field.dart';
import 'package:charanju_flutter/widgets/icon_btn_as_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class NotificationsAppBar extends StatefulWidget {
  @override
  _NotificationsAppBarState createState() => _NotificationsAppBarState();
}

class _NotificationsAppBarState extends State<NotificationsAppBar> {
  TextEditingController searchController = TextEditingController();
  final log = Logger();

  onClickChatIcon() {
    log.i("onClickChatIcon started");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        right: 2.5.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          searchNotificationsField(),
          chatIconSection(),
        ],
      ),
    );
  }

  Container searchNotificationsField() {
    return Container(
      width: 85.w,
      padding: EdgeInsets.only(
        top: 0.9375.h,
        bottom: 0.9375.h,
        // left: 3.88.w,
        left: 4.7.w,
      ),
      child: SearchNotificationField(
        controller: searchController,
        serverSearchErrorText: null, //todo send server error here
      ),
    );
  }

  IconBtnAsPngImage chatIconSection() {
    return IconBtnAsPngImage(
      onClickBtn: onClickChatIcon,
      imageUrl: Strings.COMMENT_ICON,
    );
  }
}
