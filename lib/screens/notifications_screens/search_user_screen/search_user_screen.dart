import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/dummy_data/notification_data.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/helper/modules/notification_module.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_app_bar/notification_app_bar_builder.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/avatar.dart';
import 'package:charanju_flutter/screens/notifications_screens/search_user_screen/search_user_body.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class SearchUserScreen extends StatefulWidget {
  static const routeName = '/SearchUserScreen';

  @override
  _SearchUserScreenState createState() => _SearchUserScreenState();
}

class _SearchUserScreenState extends State<SearchUserScreen> {
  List<NotificationModule> items = List.of(NotificationData.notifications);
  final log = Logger();

  onClickUserPlus() {
    log.i("onClickUserPlus started");
  }
  onClickUser(){
    log.i("onClickUser started");
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

  ListView buildUserList() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: 3,
      itemBuilder: (context, index) {
        final item = items[index];
        return buildListTile(item);
      },
    );
  }

  Widget buildListTile(NotificationModule item) => ListTile(
        contentPadding: EdgeInsets.only(
          left: 4.44.w,
          bottom: 1.87.h,
        ),
        leading: NotificationAvatar(
          imagePath: item.urlAvatar,
        ),
        title: usernameTitle(item),
        onTap: () {
          onClickUser();
        },
      );

  AutoSizeText usernameTitle(item) {
    return AutoSizeText(
      item.username,
      style: TextStyle(
        fontSize: LocalHelper.getFontSize(15),
        color: AppColors.primaryWightColor,
        fontWeight: FontWeight.w700,
        fontFamily: Strings.C_ARIAL,
      ),
    );
  }


  NotificationAppBarBuilder buildSearchUserAppBar() {
    return NotificationAppBarBuilder(
      addFollowChallengeText: false,
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
