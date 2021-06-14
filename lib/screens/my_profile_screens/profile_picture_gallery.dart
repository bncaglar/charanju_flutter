import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/screens/my_profile_screens/profile_tabs.dart';
import 'package:charanju_flutter/screens/my_profile_screens/profile_image_stack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class ProfilePictureGallery extends StatefulWidget {
  const ProfilePictureGallery({Key? key}) : super(key: key);

  @override
  _ProfilePictureGalleryState createState() => _ProfilePictureGalleryState();
}

class _ProfilePictureGalleryState extends State<ProfilePictureGallery> {
  final log = Logger();
  bool _trophyPressed = false;
  bool _balanceScalePressed = false;
  bool _achievementPressed = true;

  // onClickTrophyIconButton() {
  //   // log.i("onClickTrophyIconButton Started");
  //   // return setState(() {
  //   //   _displayed = _trophyImages;
  //   //   _trophyPressed = true;
  //   //   _balanceScalePressed = false;
  //   //   _achievementPressed = false;
  //   // });
  // }
  //
  // onClickBalanceIconButton() {
  //   // log.i("onClickBalanceIconButton Started");
  //   // return setState(() {
  //   //   _displayed = _balanceImages;
  //   //   _trophyPressed = false;
  //   //   _balanceScalePressed = true;
  //   //   _achievementPressed = false;
  //   // });
  // }
  //
  // onClickAchievementIconButton() {
  //   // log.i("onClickAchievementIconButton Started");
  //   // return setState(() {
  //   //   _displayed = _achievementImages;
  //   //   _trophyPressed = false;
  //   //   _balanceScalePressed = false;
  //   //   _achievementPressed = true;
  //   // });
  // }

  // final List<ImageStack> _trophyImages = [
  //   ImageStack(image: Strings.MY_TROPHY_IMAGE_1, icon: Strings.SURFACE_ICON),
  //   ImageStack(image: Strings.MY_TROPHY_IMAGE_2, icon: Strings.TROPYHY_ICON),
  //   ImageStack(image: Strings.MY_TROPHY_IMAGE_3, icon: Strings.MEDAL_ICON),
  //   ImageStack(image: Strings.MY_TROPHY_IMAGE_4, icon: Strings.MEDAL_ICON),
  //   ImageStack(image: Strings.MY_TROPHY_IMAGE_5, icon: Strings.MEDAL_ICON),
  //   ImageStack(image: Strings.MY_TROPHY_IMAGE_6, icon: Strings.TROPYHY_ICON),
  // ];
  // final List<ImageStack> _balanceImages = [
  //   ImageStack(image: Strings.MY_BALANCE_IMAGE_1),
  //   ImageStack(image: Strings.MY_BALANCE_IMAGE_2, icon: Strings.TROPYHY_ICON),
  //   ImageStack(image: Strings.MY_BALANCE_IMAGE_3),
  // ];

  //todo this list data should fetch from the API
  final List<ProfileImageStack> _achievementImages = [
    ProfileImageStack(backgroundImage: Strings.MY_ACHIEVEMENT_IMAGE_1),
    ProfileImageStack(
        backgroundImage: Strings.MY_ACHIEVEMENT_IMAGE_2,
        cornerIcon: Strings.TROPHY_ICON),
    ProfileImageStack(backgroundImage: Strings.MY_ACHIEVEMENT_IMAGE_3),
    ProfileImageStack(
        backgroundImage: Strings.MY_ACHIEVEMENT_IMAGE_4,
        cornerIcon: Strings.TROPHY_ICON),
    ProfileImageStack(backgroundImage: Strings.MY_ACHIEVEMENT_IMAGE_5),
    ProfileImageStack(backgroundImage: Strings.MY_ACHIEVEMENT_IMAGE_6),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTabsRow(),
        buildProfileImagesGridView(),
      ],
    );
  }

  Row buildTabsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildProfileTab(),
        buildProfileJudgeTab(),
        buildProfileBetTab(),
      ],
    );
  }

  ProfileTabs buildProfileBetTab() {
    return ProfileTabs(
      tapIcon: Strings.ACHIEVEMENT_ICON,
      tabSelected: _achievementPressed,
    );
  }

  ProfileTabs buildProfileTab() {
    return ProfileTabs(
      tapIcon: Strings.TROPHY_ICON,
      tabSelected: _trophyPressed,
    );
  }

  ProfileTabs buildProfileJudgeTab() {
    return ProfileTabs(
      tapIcon: Strings.BALANCE_SCALE_ICON,
      tabSelected: _balanceScalePressed,
    );
  }

  Container buildProfileImagesGridView() {
    return Container(
      height: 45.h,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 0.75),
        itemCount: _achievementImages.length,
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, int index) =>
            _achievementImages[index],
      ),
    );
  }
}
