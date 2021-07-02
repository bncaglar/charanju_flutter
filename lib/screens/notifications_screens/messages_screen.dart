import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/helper/modules/notification_module.dart';
import 'package:charanju_flutter/screens/notifications_screens/chat_screens/group_chat_box.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_data.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/avatar.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/time_field.dart';
import 'package:charanju_flutter/screens/notifications_screens/search_user_screen/search_user_screen.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

import 'chat_screens/chat_screen.dart';
import 'notification_screen_components/notifications_app_bar.dart';

class MessagesScreen extends StatefulWidget {
  static const routeName = '/NotificationMessagesScreen';

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  List<NotificationModule> items = List.of(NotificationData.notifications);
  final log = Logger();

  onClickCommentEditIcon() {
    log.i("onClickCommentEditIcon started");
    Navigator.pushNamed(context, SearchUserScreen.routeName);
  }

  onUserClicked(item) {
    Navigator.pushNamed(context, ChatScreen.routeName,
        arguments: ChatScreenArguments(
            urlAvatar: item.urlAvatar, username: item.username));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundPrimaryColor,
        appBar: buildMessagesScreenAppBar(),
        body: buildMessagesScreenBody(),
      ),
    );
  }

  ListView buildMessagesScreenBody() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return buildListTile(item);
      },
    );
  }

  PreferredSize buildMessagesScreenAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(7.5.h),
      child: NotificationsAppBar(
        addSearchField: false,
        addBackBtn: true,
        addIconOnAppBar: true,
        addUserPhoto: false,
        addUserName: false,
        addFilterMenu: false,
        onClickBtn: onClickCommentEditIcon,
        iconURL: Strings.COMMENT_EDIT_ICON,
      ),
    );
  }

  Widget buildListTile(NotificationModule item) {
    return ListTile(
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
          : GroupChatBox(
              item: item,
            ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          notificationUsernameTitle(item),
          displayLastMessage(item),
        ],
      ),
      subtitle: TimeField(
        item: item,
      ),
      onTap: () {
        onUserClicked(item);
      },
    );
  }

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
}
