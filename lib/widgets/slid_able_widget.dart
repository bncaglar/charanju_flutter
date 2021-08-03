import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/helper/modules/notification_module.dart';
import 'package:charanju_flutter/logger/simple_log_printer.dart';
import 'package:charanju_flutter/screens/notifications_screens/chat_screens/chat_screen.dart';
import 'package:charanju_flutter/helper/dummy_data/notification_data.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/avatar.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/time_field.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidAbleWidget extends StatefulWidget {
  final NotificationModule item;
  final int index;

  const SlidAbleWidget({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  @override
  _SlidAbleWidgetState createState() => _SlidAbleWidgetState();
}

class _SlidAbleWidgetState extends State<SlidAbleWidget> {
  final log = getLogger();

  onNotificationClicked(NotificationModule item) {
    log.i("onNotificationClicked Started Item is:$item");
  }

  onMessageNotificationClicked(item) {
    log.i("onMessageNotificationClicked started");
    Navigator.pushNamed(
      context,
      ChatScreen.routeName,
      arguments: ChatScreenArguments(
          urlAvatar: item.urlAvatar, username: item.username),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(widget.item),
      dismissal: buildDismissal(widget.index),
      actionPane: SlidableStrechActionPane(),
      secondaryActions: [slideAction()],
      actionExtentRatio: 1,
      child: buildListTile(widget.item),
    );
  }

  SlidableDismissal buildDismissal(index) {
    return SlidableDismissal(
      dismissThresholds: <SlideActionType, double>{
        SlideActionType.secondary: 0.0
      },
      child: Container(),
      onDismissed: (actionType) {
        NotificationData.items.removeAt(index);
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
            Strings.IC_SLIDABLE_TRASH,
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
          item.categories == S.of(context).messages
              ? onMessageNotificationClicked(item)
              : onNotificationClicked(item);
        },
      );

  Container notificationEllipse(item) {
    return Container(
      height: 1.87.h,
      width: 3.33.w,
      child: item.isSeen
          ? Image.asset(
              Strings.IC_NOTIFICATION_ECLIPSE,
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
        ],
      ),
    );
  }
}
