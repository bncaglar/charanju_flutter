import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/screens/home_screens/home_screen_components/story_widget.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/icon_btn_as_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class HomeAppBar extends StatefulWidget {
  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  final log = Logger();

  final List<Widget> storyList = [
    StoryWidget(
      title: "story No.1",
      image: Strings.STORY_IMAGE,
    ),
    StoryWidget(
      title: "story No.2",
      image: Strings.STORY_IMAGE,
    ),
    StoryWidget(
      title: "story No.3",
      image: Strings.STORY_IMAGE,
    ),
    StoryWidget(
      title: "story No.4",
      image: Strings.STORY_IMAGE,
    ),
    StoryWidget(
      title: "story No.5",
      image: Strings.STORY_IMAGE,
    ),
    StoryWidget(
      title: "story No.6",
      image: Strings.STORY_IMAGE,
    ),
    StoryWidget(
      title: "story No.7",
      image: Strings.STORY_IMAGE,
    ),
  ];

  onClickAppBarLogo() {
    log.i("onClickAppBarLogo started");
  }

  onClickJudge() {
    log.i("onClickJudge started");
  }

  Future<dynamic> onRefreshData() async {
    log.wtf('//todo Load the new data here ');
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: AppColors.backgroundPrimaryColor,
      stretch: true,
      onStretchTrigger: onRefreshData,
      expandedHeight: 25.h,
      leading: leadingBtn(),
      actions: [
        actionBtn(),
      ],
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: <StretchMode>[
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
        ],
        background: buildListStoryHorizontally(),
      ),
    );
  }

  DecoratedBox buildListStoryHorizontally() {
    return DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.center,
          colors: <Color>[AppColors.backgroundPrimaryColor, Colors.transparent],
        ),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 2.77.w,
          right: 2.77.w,
          top: 5.h,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [...storyList],
          ),
        ),
      ),
    );
  }

  IconBtnAsPngImage leadingBtn() {
    return IconBtnAsPngImage(
      onClickBtn: onClickAppBarLogo,
      imageUrl: Strings.APP_BAR_HOME_SCREEN_LOGO_PNG,
    );
  }

  IconBtnAsPngImage actionBtn() {
    return IconBtnAsPngImage(
      onClickBtn: onClickJudge,
      imageUrl: Strings.APP_BAR_HOME_SCREEN_BALANCE_SCALE_PNG,
    );
  }
}
