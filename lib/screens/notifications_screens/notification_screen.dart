import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/screens/notifications_screens/shared_widgets/notification_data.dart';
import 'package:charanju_flutter/screens/notifications_screens/shared_widgets/notification_helper.dart';
import 'package:charanju_flutter/screens/notifications_screens/shared_widgets/notifications_app_bar.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sizer/sizer.dart';

class NotificationScreen extends StatefulWidget {
  static const routeName = '/NotificationScreen';

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationHelper> items = List.of(NotificationData.notifications);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(7.50.h),
        child: NotificationsAppBar(),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundPrimaryColor,
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return buildSlidable(item, index);
        },
      ),
    ));
  }

  Slidable buildSlidable(item, index) {
    return Slidable(
        key: ValueKey(item),
        dismissal: buildDismissal(index),
        actionPane: SlidableStrechActionPane(),
        secondaryActions: [slideAction()],
        actionExtentRatio: 1,
        child: buildListTile(item));
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
      //key: ValueKey(item),
    );
  }

  IconSlideAction slideAction() {
    return IconSlideAction(
      color: AppColors.dismissRedColor,
      iconWidget: Container(
        height: 3.55.h,
        width: 6.32.w,
        child: Image.asset(
          Strings.SLIDABLE_TRASH,
        ),
      ),
    );
  }

  Widget buildListTile(NotificationHelper item) => ListTile(
      contentPadding: EdgeInsets.only(top: 3.28.h, left: 5.w, right: 16.6.w),
      leading: avatar(item),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [notificationContent(item)],
      ),
      subtitle: timeField(item));

  AutoSizeText timeField(item) {
    return AutoSizeText(
      item.timer,

      ///todo timer will come from API
      style: TextStyle(
        fontSize: LocalHelper.getFontSize(12),
        color: AppColors.textPrimaryColor,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Stack avatar(item) {
    return Stack(
      children: [
        CircleAvatar(
          ///todo photoURL will come from API
          radius: 28,
          backgroundImage: AssetImage(item.urlAvatar),
        ),
        Positioned(top: 0, right: 0, child: notificationEllipse(item))
      ],
    );
  }

  Container notificationEllipse(item) {
    return Container(
        height: 1.87.h,
        width: 3.33.w,
        child: item.isSeen
            ? Image.asset(
                Strings.NOTIFICATION_ECLIPSE,
                //fit: BoxFit.contain,
              )
            : Container());
  }

  RichText notificationContent(item) {
    ///TODO content of the notification title will come from API
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: item.name,
            style: TextStyle(
              fontSize: LocalHelper.getFontSize(15),
              color: AppColors.primaryWightColor,
              fontWeight: FontWeight.w700,
            )),
        TextSpan(
            text: item.title,
            style: TextStyle(
              fontSize: LocalHelper.getFontSize(15),
              color: AppColors.primaryWightColor,
              fontWeight: FontWeight.w400,
            )),
        TextSpan(
            text: item.challengeName,
            style: TextStyle(
              fontSize: LocalHelper.getFontSize(15),
              color: AppColors.primaryWightColor,
              fontWeight: FontWeight.w400,
            )),
      ]),
    );
  }
}
