import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/widgets/bet_number_text.dart';
import 'package:charanju_flutter/widgets/get_username.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfilePhotoRow extends StatefulWidget {
  @override
  _ProfilePhotoRowState createState() => _ProfilePhotoRowState();
}

class _ProfilePhotoRowState extends State<ProfilePhotoRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        rightSideUser(),
        leftSideUser(),
      ],
    );
  }

  Padding leftSideUser() {
    return Padding(
      padding: EdgeInsets.only(top: 64.50.h, right: 3.05.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          leftUserPhoto(),
          SizedBox(
            height: 1.56.h,
          ),
          BetNumberText(betNumber: "80"),
          GetUsername(username: "andrew.c")
        ],
      ),
    );
  }

  Padding rightSideUser() {
    return Padding(
      padding: EdgeInsets.only(top: 64.50.h, left: 3.05.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          rightUserPhoto(),
          SizedBox(
            height: 1.56.h,
          ),
          BetNumberText(betNumber: "100"),
          GetUsername(username: "luca100")
        ],
      ),
    );
  }

  Container leftUserPhoto() {
    return Container(
      height: 6.52.h,
      width: 10.27.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,

          ///todo get profile photo from API
          image: AssetImage(Strings.PROFILE_PHOTO_2_PNG),
        ),
      ),
    );
  }

  Container rightUserPhoto() {
    return Container(
      height: 6.52.h,
      width: 10.27.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,

          ///todo get profile photo from API
          image: AssetImage(Strings.PROFILE_PHOTO_1_PNG),
        ),
      ),
    );
  }
}
