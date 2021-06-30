import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/screens/notifications_screens/chat_screens/chat_body.dart';
import 'package:charanju_flutter/screens/notifications_screens/profile_of_another_user_screen/profile_of_another_user_screen.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/notifications_app_bar.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/ConversationPageScreen';
  final String? urlAvatar;
  final String? username;

  const ChatScreen({Key? key, this.urlAvatar, this.username}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final log = Logger();

  onClickInfoIcon() {
    log.i("onClickInfoIcon started");
    Navigator.pushNamed(context, ProfileOfAnotherUserScreen.routeName,
        arguments: ProfileOfAnotherUserScreenArguments(
            urlAvatar: widget.urlAvatar!, username: widget.username!));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.backgroundPrimaryColor,
        appBar: buildChatAppBar(),
        body: ChatBody(
          urlAvatar: widget.urlAvatar,
          username: widget.username,
        ),
      ),
    );
  }

  PreferredSize buildChatAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(7.5.h),
      child: NotificationsAppBar(
        username: widget.username,
        addIconOnAppBar: true,
        addUserPhoto: true,
        profilePicturePath: widget.urlAvatar,
        addUserName: true,
        addFilterMenu: false,
        onClickBtn: onClickInfoIcon,
        iconURL: Strings.COMMENT_INFO_ICON,
      ),
    );
  }
}

class ChatScreenArguments {
  final String username;
  final String urlAvatar;

  ChatScreenArguments({required this.urlAvatar, required this.username});
}
