import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfilePictureAndData extends StatelessWidget {
  const ProfilePictureAndData({Key? key}) : super(key: key);
  final int follows = 10;
  final int followers = 200;
  final int points = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildProfileImage(),
          buildProfileData(context),
        ],
      ),
    );
  }

  Container buildProfileData(BuildContext context) {
    return Container(
      height: 17.49.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          followsText(context, follows),
          buildFollowersText(context, followers),
          buildPointsText(context, points),
        ],
      ),
    );
  }

  Container buildProfileImage() {
    return Container(
      width: 31.1.w,
      height: 17.49.h,
      margin: EdgeInsets.only(right: 8.05.w, top: 2.18.h),
      child: CircleAvatar(
        backgroundColor: AppColors.backgroundPrimaryColor,
        child: Image.asset(Strings.NETWORK_IMAGE),
      ),
    );
  }

  AutoSizeText buildPointsText(BuildContext context, int points) {
    return AutoSizeText(
      //todo get points number
      S.of(context).points + "  " + points.toString(),
      style: TextStyle(
        color: AppColors.primaryWightColor,
        fontSize: LocalHelper.getFontSize(12),
      ),
      maxLines: 2,
      minFontSize: 14,
      textAlign: TextAlign.center,
    );
  }

  Container buildFollowersText(BuildContext context, int followers) {
    return Container(
      padding: EdgeInsets.only(top: 1.56.h, bottom: 1.56.h),
      child: AutoSizeText(
        //todo get followers number
        S.of(context).followers + "  " + followers.toString(),
        style: TextStyle(
          color: AppColors.primaryWightColor,
          fontSize: LocalHelper.getFontSize(12),
        ),
        maxLines: 2,
        minFontSize: 14,
        textAlign: TextAlign.center,
      ),
    );
  }

  AutoSizeText followsText(BuildContext context, int follows) {
    return AutoSizeText(
      //todo get follows number from API
      S.of(context).follows + "  " + follows.toString(),
      style: TextStyle(
        color: AppColors.primaryWightColor,
        fontSize: LocalHelper.getFontSize(12),
        fontWeight: FontWeight.w400,
        fontFamily: Strings.ARIAL,
      ),
      maxLines: 2,
      minFontSize: 14,
      textAlign: TextAlign.center,
    );
  }
}
