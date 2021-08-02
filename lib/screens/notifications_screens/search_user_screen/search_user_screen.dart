import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/helper/modules/notification_module.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/avatar.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/notifications_app_bar.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/icon_btn_as_image.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

import '../notification_data.dart';

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

  onClickGroupIcon() {
    log.i("onClickGroupIcon started");
  }

  onClickUser(item) {
    log.i("onClickUser started with " + item.username);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildSearchUserAppBar(),
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundPrimaryColor,
        body: buildSearchUserBody(),
      ),
    );
  }

  Column buildSearchUserBody() {
    return Column(
      children: [
        SizedBox(height: 3.125.h),
        createGroupChatRow(),
        SizedBox(height: 1.40.h),
        buildUserList()
      ],
    );
  }

  Row createGroupChatRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 6.94.w),
        groupChatIcon(),
        SizedBox(width: 2.77.w),
        groupChatText()
      ],
    );
  }

  IconBtnAsPngImage groupChatIcon() {
    return IconBtnAsPngImage(
        imageUrl: Strings.USER_ALT_PNG, onClickBtn: onClickGroupIcon);
  }

  AutoSizeText groupChatText() {
    return AutoSizeText(
      S.of(context).createGroupChat,
      style: TextStyle(
        fontSize: LocalHelper.getFontSize(15),
        color: AppColors.primaryWightColor,
        fontWeight: FontWeight.w700,
        fontFamily: Strings.ARIAL,
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
          onClickUser(item);
        },
      );

  AutoSizeText usernameTitle(item) {
    return AutoSizeText(
      item.username,
      style: TextStyle(
        fontSize: LocalHelper.getFontSize(15),
        color: AppColors.primaryWightColor,
        fontWeight: FontWeight.w700,
        fontFamily: Strings.ARIAL,
      ),
    );
  }

  PreferredSize buildSearchUserAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(7.5.h),
      child: NotificationsAppBar(
        addSearchField: true,
        addIconOnAppBar: true,
        addUserPhoto: false,
        addFollowChallengeText: false,
        addUserName: false,
        addFilterMenu: false,
        onClickBtn: onClickUserPlus,
        iconURL: Strings.USER_PLUS_PNG,
        addBackBtn: true,
      ),
    );
  }
}
