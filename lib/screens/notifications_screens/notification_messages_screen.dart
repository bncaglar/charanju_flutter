import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/helper/modules/notification_module.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_data.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/avatar.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/time_field.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

import 'conversations_screens/conversation_page.dart';
import 'notification_screen_components/notifications_app_bar.dart';

class NotificationMessagesScreen extends StatefulWidget {
  static const routeName = '/NotificationMessagesScreen';

  @override
  _NotificationMessagesScreenState createState() =>
      _NotificationMessagesScreenState();
}

class _NotificationMessagesScreenState
    extends State<NotificationMessagesScreen> {
  List<NotificationModule> items = List.of(NotificationData.notifications);
  final log = Logger();

  onClickCommentEditIcon() {
    log.i("onClickCommentEditIcon started");
  }

  onUserClicked(item) {
    Navigator.pushNamed(context, ConversationPageScreen.routeName,
        arguments: ConversationPageArguments(urlAvatar: item.urlAvatar, username: item.username));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(7.5.h),
        child: NotificationsAppBar(
          addIconOnAppBar: true,
          addUserPhoto: false,
          addUserName: false,
          addSearchField: false,
          onClickBtn: onClickCommentEditIcon,
          iconURL: Strings.COMMENT_EDIT_ICON,
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundPrimaryColor,
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return buildListTile(item);
        },
      ),
    ));
  }

  Widget buildListTile(NotificationModule item) => ListTile(
        contentPadding: EdgeInsets.only(
          top: 1.64.h,
          left: 5.w,
          right: 14.6.w,
          bottom: 1.64.h,
        ),
        leading: item.groupMembers.toString().isEmpty
            ? NotificationAvatar(
                imagePath: item.urlAvatar,
              )
            : groupChatBox(item),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [notificationUsernameTitle(item), displayLastMessage(item)],
        ),
        subtitle: NotificationScreenTimeField(
          item: item,
        ),
        onTap: () {
          onUserClicked(item);
        },
      );

  Text notificationUsernameTitle(item) {
    ///TODO content of the notification title will come from API
    return Text(
      item.groupMembers.toString().isEmpty ? item.username : item.groupTitle,
      style: TextStyle(
        fontSize: LocalHelper.getFontSize(15),
        color: AppColors.primaryWightColor,
        fontWeight: FontWeight.w700,
        fontFamily: Strings.ARIAL,
      ),
    );
  }

  Text displayLastMessage(item) {
    return Text(
      item.lastMessage,
      style: TextStyle(
        fontSize: LocalHelper.getFontSize(14),
        color: AppColors.textPrimaryColor,
        fontWeight: FontWeight.w400,
        fontFamily: Strings.ARIAL,
      ),
    );
  }

  SizedBox groupChatBox(item) {
    return SizedBox(
      width: 17.w,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 2.31.h,
            child: NotificationAvatar(
              imagePath: item.urlAvatar,
              radius: 25,
            ),
          ),
          Positioned(
            top: 3.50.h,
            left: 4.95.w,
            child: NotificationAvatar(
              imagePath: item.groupMembers,
              radius: 25,
            ),
          ),
        ],
      ),
    );
  }
}
