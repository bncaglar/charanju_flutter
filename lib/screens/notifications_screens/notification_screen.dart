import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/logger/simple_log_printer.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_app_bar/notification_app_bar_builder.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_body.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'messages_screen/messages_screen.dart';

class NotificationScreen extends StatefulWidget {
  static const routeName = '/NotificationScreen';

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final log = getLogger();

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
        appBar: NotificationAppBarBuilder(
          onClickBtn: onClickChatIcon,
          iconURL: Strings.IC_COMMENT_ICON,
          addUserPhoto: false,
          addUserName: false,
          addSearchField: false,
          addIconOnAppBar: true,
          addFilterMenu: true,
          addBackBtn: false,
        ),
        body: NotificationBody(),
      ),
    );
  }
}
