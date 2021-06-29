import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/buildProfilePicture.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/notifications_app_bar.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class ProfileOfAnotherUser extends StatefulWidget {
  final String? urlAvatar;
  final String? username;
  static const routeName = '/ProfileOfAnotherUser';

  const ProfileOfAnotherUser({Key? key, this.urlAvatar, this.username}) : super(key: key);

  @override
  _ProfileOfAnotherUserState createState() => _ProfileOfAnotherUserState();
}

class _ProfileOfAnotherUserState extends State<ProfileOfAnotherUser> {
  final log = Logger();

  onClickShowProfile() {
    log.i("onClickShowProfile started");
  }

  onClickFollows() {
    log.i("onClickFollows started");
  }

  onClickAddFriend() {
    log.i("onClickAddFriend started");
  }

  onClickAddUserToChat() {
    log.i("onClickAddUserToChat started");
  }

  onClickChallengeUser() {
    log.i("onClickChallengeUser started");
  }

  onClickCreateTeam() {
    log.i("onClickCreateTeam started");
  }

  onClickSilenceChat() {
    log.i("onClickSilenceChat started");
  }

  onClickBlock() {
    log.i("onClickBlock started");
  }

  onClickReport() {
    log.i("onClickReport started");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(7.5.h),
        child: NotificationsAppBar(
          username: widget.username,
          addIconOnAppBar: false,
          addUserPhoto: false,
          profilePicturePath: Strings.NOTIFICATION_AVATAR_1,
          addUserName: true,
          addSearchField: false,
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundPrimaryColor,
      body: Column(
        children: [
          SizedBox(height: 0.78.h),
          Row(
            children: [
              SizedBox(
                width: 13.05.w,
              ),
              BuildProfilePicture(
                imagePath: widget.urlAvatar!,
              ),
              SizedBox(
                width: 7.77.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.34.h,
                  ),
                  buildBiographyContent("Show Profile", () {
                    onClickShowProfile();
                  }),
                  SizedBox(
                    height: 1.25.h,
                  ),
                  buildBiographyContent("Follows", () {
                    onClickFollows();
                  }),
                  SizedBox(
                    height: 1.71.h,
                  ),
                  buildBiographyContent("Add Friend", () {
                    onClickAddFriend();
                  }),
                  SizedBox(
                    height: 1.71.h,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 5.93.h,
          ),
          buildRectangle("Add users to this chat", () {
            onClickAddUserToChat();
          }),
          buildRectangle("Challange "+ widget.username!, () {
            onClickChallengeUser();
          }),
          buildRectangle("Create team challange with " +widget.username!, () {
            onClickCreateTeam();
          }),
          SizedBox(
            height: 4.84.h,
          ),
          buildRectangle("Silence chat", () {
            onClickSilenceChat();
          }),
          buildRectangle("Block", () {
            onClickBlock();
          }),
          buildRectangle("Report", () {
            onClickReport();
          }),
        ],
      ),
    ));
  }

  InkWell buildBiographyContent(String content, VoidCallback onClick) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Text(
        content,
        style: TextStyle(
          fontSize: LocalHelper.getFontSize(12),
          color: AppColors.primaryWightColor,
          fontWeight: FontWeight.w400,
          fontFamily: Strings.ARIAL,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Container buildRectangle(String text, VoidCallback onClick) {
    return Container(
      padding: EdgeInsets.only(left: 4.72.w),
      height: 7.343.h,
      width: double.infinity,
      color: AppColors.modalBottomSheetColor,
      child: Padding(
          padding: EdgeInsets.only(
            top: 2.10.h,
            bottom: 2.10.h,
          ),
          child: buildBiographyContent(text, onClick)),
    );
  }
}
class ProfileOfAnotherUserArguments {
  final String username;
  final String urlAvatar;

  ProfileOfAnotherUserArguments({required this.urlAvatar, required this.username});
}