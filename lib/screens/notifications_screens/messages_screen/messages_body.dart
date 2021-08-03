import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/helper/modules/notification_module.dart';
import 'package:charanju_flutter/logger/simple_log_printer.dart';
import 'package:charanju_flutter/screens/notifications_screens/chat_screens/chat_screen.dart';
import 'package:charanju_flutter/screens/notifications_screens/chat_screens/group_chat_box.dart';
import 'package:charanju_flutter/helper/dummy_data/notification_data.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/avatar.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/time_field.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MessagesBody extends StatefulWidget {
  const MessagesBody({Key? key}) : super(key: key);

  @override
  _MessagesBodyState createState() => _MessagesBodyState();
}

class _MessagesBodyState extends State<MessagesBody> {
  final log = getLogger();

  onUserClicked(item) {
    log.i("onUserClicked started");
    Navigator.pushNamed(context, ChatScreen.routeName,
        arguments: ChatScreenArguments(
            urlAvatar: item.urlAvatar, username: item.username));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: NotificationData.items.length,
      itemBuilder: (context, index) {
        final item = NotificationData.items[index];
        return buildListTile(item);
      },
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
      leading: buildLeading(item),
      title: buildTitle(item),
      subtitle: TimeField(item: item),
      onTap: () {
        onUserClicked(item);
      },
    );
  }

  Widget buildLeading(NotificationModule item) {
    return item.groupMembers.toString().isEmpty
        ? NotificationAvatar(
            imagePath: item.urlAvatar,
          )
        : GroupChatBox(
            item: item,
          );
  }

  Column buildTitle(NotificationModule item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildNotificationUsernameTitle(item),
        buildDisplayLastMessage(item),
      ],
    );
  }

  Text buildNotificationUsernameTitle(item) {
    ///TODO content of the notification title will come from API
    return Text(
      item.groupMembers.toString().isEmpty ? item.username : item.groupTitle,
      style: TextStyle(
        fontSize: LocalHelper.getFontSize(15),
        color: AppColors.primaryWightColor,
        fontWeight: FontWeight.w700,
        fontFamily: Strings.C_ARIAL,
      ),
    );
  }

  Text buildDisplayLastMessage(item) {
    return Text(
      item.lastMessage,
      style: TextStyle(
        fontSize: LocalHelper.getFontSize(14),
        color: AppColors.textPrimaryColor,
        fontWeight: FontWeight.w400,
        fontFamily: Strings.C_ARIAL,
      ),
    );
  }
}
