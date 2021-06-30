import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_data.dart';
import 'package:charanju_flutter/helper/modules/notification_module.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/avatar.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/time_field.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/notifications_app_bar.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

import 'messages_screen.dart';

class NotificationScreen extends StatefulWidget {
  static const routeName = '/NotificationScreen';

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationModule> items = List.of(NotificationData.notifications);
  final log = Logger();

  onNotificationClicked(NotificationModule item) {
    log.i("onNotificationClicked Started Item is:$item");
  }

  onClickChatIcon() {
    log.i("onClickChatIcon started");
    Navigator.pushNamed(context, MessagesScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundPrimaryColor,
        appBar: buildNotificationAppBar(),
        body: buildNotificationBody(),
      ),
    );
  }

  ListView buildNotificationBody() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return buildSlidAble(item, index);
      },
    );
  }

  PreferredSize buildNotificationAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(7.5.h),
      child: NotificationsAppBar(
        addIconOnAppBar: true,
        addUserPhoto: false,
        addUserName: false,
        addFilterMenu: true,
        onClickBtn: onClickChatIcon,
        iconURL: Strings.COMMENT_ICON,
      ),
    );
  }

  Slidable buildSlidAble(item, index) {
    return Slidable(
      key: ValueKey(item),
      dismissal: buildDismissal(index),
      actionPane: SlidableStrechActionPane(),
      secondaryActions: [slideAction()],
      actionExtentRatio: 1,
      child: buildListTile(item),
    );
  }

  SlidableDismissal buildDismissal(index) {
    return SlidableDismissal(
      dismissThresholds: <SlideActionType, double>{
        SlideActionType.secondary: 0.0
      },
      child: Container(),
      onDismissed: (actionType) {
        setState(() {
          items.removeAt(index);
        });
      },
    );
  }

  IconSlideAction slideAction() {
    return IconSlideAction(
      color: Colors.transparent,
      iconWidget: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.dismissRedColor,
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 3.h, bottom: 3.h),
          margin: EdgeInsets.only(top: 1.h, bottom: 1.h),
          child: Image.asset(
            Strings.SLIDABLE_TRASH,
            height: 3.55.h,
            width: 6.32.w,
          ),
        ),
      ),
    );
  }

  Widget buildListTile(NotificationModule item) => ListTile(
        contentPadding: EdgeInsets.only(
          top: 1.64.h,
          left: 5.w,
          right: 14.6.w,
          bottom: 1.64.h,
        ),
        leading: NotificationAvatar(
          imagePath: item.urlAvatar,
          notificationEllipse: notificationEllipse(item),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [notificationContent(item)],
        ),
        subtitle: TimeField(
          item: item,
        ),
        onTap: () {
          onNotificationClicked(item);
        },
      );

  Container notificationEllipse(item) {
    return Container(
      height: 1.87.h,
      width: 3.33.w,
      child: item.isSeen
          ? Image.asset(
              Strings.NOTIFICATION_ECLIPSE,
            )
          : Container(),
    );
  }

  RichText notificationContent(item) {
    ///TODO content of the notification title will come from API
    return RichText(
      text: TextSpan(
          style: TextStyle(
            fontSize: LocalHelper.getFontSize(15),
            color: AppColors.primaryWightColor,
            fontWeight: FontWeight.w400,
          ),
          children: [
            TextSpan(
              text: item.notificationFromUserName,
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            TextSpan(
              text: item.notificationMessage,
            ),
            TextSpan(
              text: item.challengeName,
            ),
          ]),
    );
  }
}
