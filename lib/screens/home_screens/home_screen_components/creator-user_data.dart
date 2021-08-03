import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/screens/home_screens/home_screen_components/creator_avatar.dart';
import 'package:charanju_flutter/widgets/text_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CreatorUserData extends StatefulWidget {
  final bool rightImage;
  final bool leftImage;

  CreatorUserData({
    required this.rightImage,
    required this.leftImage,
  });

  @override
  _CreatorUserDataState createState() => _CreatorUserDataState();
}

class _CreatorUserDataState extends State<CreatorUserData> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget.rightImage ? Container() : leftSideUserData(),
        widget.leftImage ? Container() : rightSideUserData(),
      ],
    );
  }

  Container rightSideUserData() {
    return Container(
      padding: EdgeInsets.only(right: 2.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ///todo get profile photo from API
          CreatorAvatar(
            image: Strings.IM_PROFILE_PHOTO_2_PNG,
            padding: EdgeInsets.only(right: 3.05.w),
          ),
          TextBtn(
            text: "80" + Strings.C_BETS + "\n" + Strings.C_DUMMY_USER_NAME,
            textSize: 12,
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }

  Padding leftSideUserData() {
    return Padding(
      padding: EdgeInsets.only(
        top: 64.50.h,
        // left: 3.05.w,
        left: 2.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///todo get profile photo from API
          CreatorAvatar(
            image: Strings.IM_PROFILE_PHOTO_1_PNG,
            padding: EdgeInsets.only(
              left: 3.05.w,
            ),
          ),
          TextBtn(
            text: "100" + Strings.C_BETS + "\n" + Strings.C_DUMMY_USER_NAME,
            textSize: 12,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
