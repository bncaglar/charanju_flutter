import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/logger/simple_log_printer.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_app_bar/notification_app_bar_builder.dart';
import 'package:charanju_flutter/screens/notifications_screens/search_user_screen/search_user_body.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';

class SearchUserScreen extends StatefulWidget {
  static const routeName = '/SearchUserScreen';

  @override
  _SearchUserScreenState createState() => _SearchUserScreenState();
}

class _SearchUserScreenState extends State<SearchUserScreen> {
  final log = getLogger();

  onClickUserPlus() {
    log.i("onClickUserPlus started");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildSearchUserAppBar(),
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundPrimaryColor,
        body: SearchUserBody(),
      ),
    );
  }

  NotificationAppBarBuilder buildSearchUserAppBar() {
    return NotificationAppBarBuilder(
      addSearchField: true,
      addIconOnAppBar: true,
      addUserPhoto: false,
      addUserName: false,
      addFilterMenu: false,
      onClickBtn: onClickUserPlus,
      iconURL: Strings.IC_USER_PLUS_PNG,
      addBackBtn: true,
    );
  }
}
