import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/logger/simple_log_printer.dart';
import 'package:charanju_flutter/screens/notifications_screens/messages_screen/messages_body.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_app_bar/notification_app_bar_builder.dart';
import 'package:charanju_flutter/screens/notifications_screens/search_user_screen/search_user_screen.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  static const routeName = '/NotificationMessagesScreen';

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final log = getLogger();

  onClickCommentEditIcon() {
    log.i("onClickCommentEditIcon started");
    Navigator.pushNamed(context, SearchUserScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundPrimaryColor,
        appBar: NotificationAppBarBuilder(
          addBackBtn: true,
          addFilterMenu: false,
          addIconOnAppBar: true,
          addSearchField: false,
          addUserName: false,
          addUserPhoto: false,
          iconURL: Strings.IC_COMMENT_EDIT_ICON,
          onClickBtn: onClickCommentEditIcon,
        ),
        body: MessagesBody(),
      ),
    );
  }
}
