import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/modules/chat_module.dart';
import 'package:charanju_flutter/screens/notifications_screens/chat_screens/text_message_bubble.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChatMessagesItem extends StatelessWidget {
  final ChatModule item;
  final String urlAvatar;

  const ChatMessagesItem({
    Key? key,
    required this.item,
    required this.urlAvatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.93.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment:
            item.isOwnMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          buildTheRightOrLeftUserAvatar(isLeftUser: true),
          buildTheMessage(),
          buildTheRightOrLeftUserAvatar(isLeftUser: false),
        ],
      ),
    );
  }

  Widget buildTheRightOrLeftUserAvatar({required bool isLeftUser}) {
    final leftUser = !item.isOwnMessage
        ? userImage(
            padding: EdgeInsets.only(
              left: 4.72.w,
              right: 1.66.w,
            ),
            urlAvatar: urlAvatar)
        : Container();

    final rightUser = !item.isOwnMessage
        ? Container()
        : userImage(
            padding: EdgeInsets.only(
              left: 1.66.w,
              right: 4.72.w,
            ),
            urlAvatar: Strings.NOTIFICATION_AVATAR_2);

    return isLeftUser ? leftUser : rightUser;
  }

  TextMessageBubble buildTheMessage() {
    return TextMessageBubble(
      message: item.messages!,
      item: item,
    );
  }

  Container userImage(
      {required String urlAvatar, required EdgeInsetsGeometry? padding}) {
    return Container(
      padding: padding,
      child: NotificationAvatar(
        imagePath: urlAvatar,
        radius: 18,
      ),
    );
  }
}
