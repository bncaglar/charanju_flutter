import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_app_bar/notification_app_bar_builder.dart';
import 'package:charanju_flutter/screens/notifications_screens/profile_of_another_user_screen/another_user_info_with_photo.dart';
import 'package:charanju_flutter/screens/notifications_screens/profile_of_another_user_screen/another_user_profile_settings.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileOfAnotherUserScreen extends StatefulWidget {
  static const routeName = '/ProfileOfAnotherUser';
  final String? urlAvatar;
  final String? username;

  const ProfileOfAnotherUserScreen({Key? key, this.urlAvatar, this.username})
      : super(key: key);

  @override
  _ProfileOfAnotherUserScreenState createState() =>
      _ProfileOfAnotherUserScreenState();
}

class _ProfileOfAnotherUserScreenState
    extends State<ProfileOfAnotherUserScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundPrimaryColor,
        appBar: buildAnotherUserAppBar(),
        body: buildAnotherUserBody(),
      ),
    );
  }

  Column buildAnotherUserBody() {
    return Column(
      children: [
        AnotherUserInfoWithPhoto(
          urlAvatar: widget.urlAvatar,
        ),
        AnotherUserProfileSettings(
          username: widget.username,
        )
      ],
    );
  }

  NotificationAppBarBuilder buildAnotherUserAppBar() {
    return NotificationAppBarBuilder(
      addSearchField: false,
      addBackBtn: true,
      username: widget.username,
      addIconOnAppBar: false,
      addUserPhoto: false,
      profilePicturePath: Strings.IM_NOTIFICATION_AVATAR_1,
      addUserName: true,
      addFilterMenu: false,
    );
  }
}

class ProfileOfAnotherUserScreenArguments {
  final String username;
  final String urlAvatar;

  ProfileOfAnotherUserScreenArguments(
      {required this.urlAvatar, required this.username});
}
