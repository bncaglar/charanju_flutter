import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/screens/home_screens/shared_widgets/announcementText.dart';
import 'package:charanju_flutter/widgets/challange_name.dart';
import 'package:charanju_flutter/screens/home_screens/shared_widgets/profile_photo_row.dart';
import 'package:charanju_flutter/widgets/reply_icon.dart';
import 'package:charanju_flutter/widgets/custom_app_bar_home_screen.dart';
import 'package:charanju_flutter/screens/home_screens/shared_widgets/megaphone_icon.dart';
import 'package:charanju_flutter/screens/home_screens/shared_widgets/split_images.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/linear_gradient_shadow.dart';
import 'package:charanju_flutter/widgets/upPoints.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainHomeScreen extends StatefulWidget {
  static const routeName = '/MainHomeScreen';

  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundPrimaryColor,
        body: buildBody(context),
      ),
    );
  }

  Column buildBody(BuildContext context) {
    return Column(
      children: [
        AppBarHomeScreen(),
        buildHomeScreen(),
      ],
    );
  }

  Stack buildHomeScreen() {
    return Stack(
      children: [
        Row(
          children: <Widget>[leftImage(), blankLine(), rightImage()],
        ),
        upLinearGradientShadow(),
        downLinearGradientShadow(),
        Row(
          children: [MegaphoneIcon(), announcementText()],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            UpPoints(point: "180"),
            ChallengeName(challengeName: "outdoorchallenge"),
            ReplyIcon()
          ],
        ),
        ProfilePhotoRow()
      ],
    );
  }

  Container blankLine() {
    return Container(
      height: 90.69.h,
      width: 1.w,
      color: Colors.white,
    );
  }

  Expanded leftImage() {
    return Expanded(
        flex: 50, child: SplitImages(imagePath: Strings.LeftExamplePhoto));
  }

  Expanded rightImage() {
    return Expanded(
        flex: 50, child: SplitImages(imagePath: Strings.RightExamplePhoto));
  }

  AnnouncementText announcementText() {
    return AnnouncementText(
      announcementText: S.of(context).announcementText,
    );
  }

  LinearGradientShadow upLinearGradientShadow() {
    return LinearGradientShadow(
        topPadding: 0.h, height: 15.44.h, topOpacity: 0.60, bottomOpacity: 0.0);
  }

  LinearGradientShadow downLinearGradientShadow() {
    return LinearGradientShadow(
        topPadding: 68.66.h,
        height: 22.18.h,
        topOpacity: 0.00,
        bottomOpacity: 0.60);
  }
}
