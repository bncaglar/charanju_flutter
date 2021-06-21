import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/logic/cubit/profile_tab_selscted_cubit/profile_tab_selected_cubit.dart';
import 'package:charanju_flutter/screens/my_profile_screens/profile_tabs.dart';
import 'package:charanju_flutter/screens/my_profile_screens/profile_image_stack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class ProfilePictureGallery extends StatefulWidget {
  const ProfilePictureGallery({Key? key}) : super(key: key);

  @override
  _ProfilePictureGalleryState createState() => _ProfilePictureGalleryState();
}

class _ProfilePictureGalleryState extends State<ProfilePictureGallery> {
  final log = Logger();

// todo this list data should fetch from the API
  final List<ProfileImageStack> _profileTabImages = [
    ProfileImageStack(
        backgroundImage: Strings.MY_TROPHY_IMAGE_1,
        cornerIcon: Strings.LOADING_CHALLENGE_ICON),
    ProfileImageStack(
        backgroundImage: Strings.MY_TROPHY_IMAGE_2,
        cornerIcon: Strings.TROPHY_ICON),
    ProfileImageStack(
      backgroundImage: Strings.MY_TROPHY_IMAGE_3,
    ),
    ProfileImageStack(
      backgroundImage: Strings.MY_TROPHY_IMAGE_4,
    ),
    ProfileImageStack(
      backgroundImage: Strings.MY_TROPHY_IMAGE_5,
    ),
    ProfileImageStack(
        backgroundImage: Strings.MY_TROPHY_IMAGE_6,
        cornerIcon: Strings.TROPHY_ICON),
  ];

// todo this list data should fetch from the API
  final List<ProfileImageStack> _balanceImages = [
    ProfileImageStack(backgroundImage: Strings.MY_BALANCE_IMAGE_1),
    ProfileImageStack(
        backgroundImage: Strings.MY_BALANCE_IMAGE_2,
        cornerIcon: Strings.TROPHY_ICON),
    ProfileImageStack(backgroundImage: Strings.MY_BALANCE_IMAGE_3),
  ];

// todo this list data should fetch from the API
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
        buildProfileJudgeTab(),
        buildProfileTab(),
        buildProfileBetTab(),
      ],
    );
  }

  BlocBuilder buildProfileBetTab() {
    return BlocBuilder<ProfileTabSelectedCubit, ProfileTabSelectedState>(
      builder: (context, state) {
        return ProfileTabs(
          tapIcon: Strings.ACHIEVEMENT_ICON,
          tabSelected: state is BetTabSelected,
        );
      },
    );
  }

  BlocBuilder buildProfileTab() {
    return BlocBuilder<ProfileTabSelectedCubit, ProfileTabSelectedState>(
      builder: (context, state) {
        return ProfileTabs(
          tapIcon: Strings.TROPHY_ICON,
          tabSelected: state is ProfileTabSelected,
        );
      },
    );
  }

  BlocBuilder buildProfileJudgeTab() {
    return BlocBuilder<ProfileTabSelectedCubit, ProfileTabSelectedState>(
      builder: (context, state) {
        return ProfileTabs(
          tapIcon: Strings.BALANCE_SCALE_ICON,
          tabSelected: state is JudgeTabSelected,
        );
      },
    );
  }

  Container buildProfileImagesGridView() {
    return Container(
      height: 43.h,
      width: double.infinity,
      child: BlocBuilder<ProfileTabSelectedCubit, ProfileTabSelectedState>(
        builder: (context, state) {
          if (state is BetTabSelected) {
            return buildBetTabGridImages();
          }
          if (state is ProfileTabSelected) {
            return buildProfileTabGridImages();
          }
          if (state is JudgeTabSelected) {
            return buildJudgeTabGridImages();
          }
          return Container();
        },
      ),
    );
  }

  GridView buildBetTabGridImages() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 0.75),
      itemCount: _achievementImages.length,
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) =>
          _achievementImages[index],
    );
  }

  GridView buildProfileTabGridImages() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 0.75),
      itemCount: _profileTabImages.length,
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) =>
          _profileTabImages[index],
    );
  }

  GridView buildJudgeTabGridImages() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 0.75),
      itemCount: _balanceImages.length,
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) => _balanceImages[index],
    );
  }
}
