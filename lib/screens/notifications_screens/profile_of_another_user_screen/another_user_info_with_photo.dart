import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/avatar.dart';
import 'package:charanju_flutter/screens/notifications_screens/profile_of_another_user_screen/biography_content.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class AnotherUserInfoWithPhoto extends StatefulWidget {
  final String? urlAvatar;

  const AnotherUserInfoWithPhoto({Key? key, this.urlAvatar}) : super(key: key);

  @override
  _AnotherUserInfoWithPhotoState createState() =>
      _AnotherUserInfoWithPhotoState();
}

class _AnotherUserInfoWithPhotoState extends State<AnotherUserInfoWithPhoto> {
  final log = Logger();

  onClickAddFriend() {
    log.i("onClickAddFriend started");
  }

  onClickFollows() {
    log.i("onClickFollows started");
  }

  onClickShowProfile() {
    log.i("onClickShowProfile started");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 0.78.h,
        bottom: 5.93.h,
        left: 13.05.w,
      ),
      child: Row(
        children: [
          buildUserAvatar(),
          buildUserData(),
        ],
      ),
    );
  }

  NotificationAvatar buildUserAvatar() {
    return NotificationAvatar(
      imagePath: widget.urlAvatar!,
      radius: 59,
    );
  }

  Container buildUserData() {
    return Container(
      padding: EdgeInsets.only(
        left: 7.77.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildShowProfileRow(),
          buildFollowersRow(),
          buildAddFriend(),
        ],
      ),
    );
  }

  BiographyContent buildShowProfileRow() {
    return BiographyContent(
      padding: EdgeInsets.only(top: 2.34.h),
      content: S.of(context).showProfile,
      onClick: () {
        onClickShowProfile();
      },
    );
  }

  BiographyContent buildFollowersRow() {
    return BiographyContent(
      padding: EdgeInsets.only(top: 1.25.h),
      content: S.of(context).follows,
      onClick: () {
        onClickFollows();
      },
    );
  }

  BiographyContent buildAddFriend() {
    return BiographyContent(
      padding: EdgeInsets.only(
        top: 1.71.h,
        bottom: 1.71.h,
      ),
      content: S.of(context).addFriend,
      onClick: () {
        onClickAddFriend();
      },
    );
  }
}
