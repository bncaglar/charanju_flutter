import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfilePictureRow extends StatelessWidget {
  const ProfilePictureRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int follows = 10;
    final int followers = 200;
    final int points = 10;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 13.w,
        ),
        buildProfileImage(),
        SizedBox(
          width: 6.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 2.h,
            ),
            followsText(context, follows),
            buildFollowersText(context, followers),
            buildPointsText(context, points),
          ],
        ),
      ],
    );
  }

  Container buildProfileImage() {
    return Container(
      width: 31.1.w,
      height: 17.49.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Strings.NETWORK_IMAGE),
        ),
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

  AutoSizeText buildFollowersText(BuildContext context, int followers) {
    return AutoSizeText(
      //todo get followers number
      S.of(context).followers + "  " + followers.toString() + "\n\n",
      style: TextStyle(
        color: AppColors.primaryWightColor,
        fontSize: LocalHelper.getFontSize(12),
      ),
      maxLines: 2,
      minFontSize: 14,
      textAlign: TextAlign.center,
    );
  }

  AutoSizeText followsText(BuildContext context, int follows) {
    return AutoSizeText(
      //todo get follows number
      S.of(context).follows + "  " + follows.toString() + "\n\n",
      style: TextStyle(
        color: AppColors.primaryWightColor,
        fontSize: LocalHelper.getFontSize(12),
      ),
      maxLines: 2,
      minFontSize: 14,
      textAlign: TextAlign.center,
    );
  }
}
