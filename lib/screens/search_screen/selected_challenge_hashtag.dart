import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/logger/simple_log_printer.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/notifications_app_bar.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/search_screen_components/background_split_image.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/search_screen_components/custom_auto_size_text.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'challengeSplitImages.dart';

class SelectedChallengeHashTagPage extends StatefulWidget {
  static const routeName = '/SelectedChallengeHashTagPage';
  final String? challengeName;
  final String? challengeDescription;
  final String? challengePhotoRight;
  final String? challengePhotoLeft;

  const SelectedChallengeHashTagPage(
      {Key? key,
      this.challengeName,
      this.challengeDescription,
      this.challengePhotoLeft,
      this.challengePhotoRight})
      : super(key: key);

  @override
  _SelectedChallengeHashTagPageState createState() =>
      _SelectedChallengeHashTagPageState();
}

class _SelectedChallengeHashTagPageState
    extends State<SelectedChallengeHashTagPage> {
  final log = getLogger();

  onClickFollowChallenge() {
    log.i("onClickFollowChallenge started");
  }

  onClickChallengePost() {
    log.i("onClickChallengePost started");
    Navigator.pushNamed(
      context,
      ChallengeSplitImages.routeName,
      arguments: ChallengeSplitImagesArguments(
        challengeName: widget.challengeName!,
        leftPhoto: widget.challengePhotoLeft!,
        rightPhoto: widget.challengePhotoRight!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundPrimaryColor,
        appBar: buildSelectedChallengeAppBar(),
        body: buildChallengeHashTagBody(),
      ),
    );
  }

  SingleChildScrollView buildChallengeHashTagBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildChallengeHeader(),
          buildChallengePosts(),
        ],
      ),
    );
  }

  Container buildChallengeHeader() {
    return Container(
      width: double.infinity,
      height: 27.02.h,
      child: Padding(
        padding: EdgeInsets.only(left: 2.77.w, top: 1.562.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildChallengeName(),
            SizedBox(
              height: 2.187.h,
            ),
            buildChallengeDescription(),
            SizedBox(
              height: 1.56.h,
            ),
            buildChallengeNotes()
          ],
        ),
      ),
    );
  }

  Container buildChallengeNotes() {
    return Container(
      height: 12.18.h,
      width: 45.55.w,
      child: AutoSizeText(
        "Lorem ipsum dolor sit amet, consectet adipiscing elit, sed do eiusmod tempor incididunt ut labore",
        style: TextStyle(
          fontSize: LocalHelper.getFontSize(13),
          color: AppColors.primaryWightColor,
          fontWeight: FontWeight.w400,
          fontFamily: Strings.ARIAL,
        ),
        maxLines: 8,
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget buildChallengePosts() {
    return GridView.count(
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      mainAxisSpacing: 1.56.h,
      childAspectRatio: 1.35,
      crossAxisSpacing: 2.7.w,
      children: [
        InkWell(
          onTap: () {
            onClickChallengePost();
          },
          child: OneBackgroundChallengeSplitImage(
            challengePhotoLeft: widget.challengePhotoLeft,
            challengePhotoRight: widget.challengePhotoRight,
            photoWidth: 24.16.w,
            photoHeight: 22.96.h,
          ),
        ),
        OneBackgroundChallengeSplitImage(
          challengePhotoLeft: widget.challengePhotoLeft,
          challengePhotoRight: widget.challengePhotoRight,
          photoWidth: 24.16.w,
          photoHeight: 22.96.h,
        ),
        OneBackgroundChallengeSplitImage(
          challengePhotoLeft: widget.challengePhotoLeft,
          challengePhotoRight: widget.challengePhotoRight,
          photoWidth: 24.16.w,
          photoHeight: 22.96.h,
        ),
        OneBackgroundChallengeSplitImage(
          challengePhotoLeft: widget.challengePhotoLeft,
          challengePhotoRight: widget.challengePhotoRight,
          photoWidth: 24.16.w,
          photoHeight: 22.96.h,
        ),
        OneBackgroundChallengeSplitImage(
          challengePhotoLeft: widget.challengePhotoLeft,
          challengePhotoRight: widget.challengePhotoRight,
          photoWidth: 24.16.w,
          photoHeight: 22.96.h,
        ),
        OneBackgroundChallengeSplitImage(
          challengePhotoLeft: widget.challengePhotoLeft,
          challengePhotoRight: widget.challengePhotoRight,
          photoWidth: 24.16.w,
          photoHeight: 22.96.h,
        ),
      ],
    );
  }

  SearchScreenCustomAutoSizeText buildChallengeDescription() {
    return SearchScreenCustomAutoSizeText(
      content: widget.challengeDescription,
    );
  }

  Container buildChallengeName() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchScreenCustomAutoSizeText(
            content: widget.challengeName,
          ),
          SizedBox(
            height: 1,
          ),
          Container(
            width: 19.16.w,
            height: 1,
            color: AppColors.primaryWightColor,
          )
        ],
      ),
    );
  }

  PreferredSize buildSelectedChallengeAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(7.5.h),
      child: NotificationsAppBar(
        addSearchField: false,
        addIconOnAppBar: true,
        addUserPhoto: false,
        addUserName: false,
        addFilterMenu: false,
        onClickBtn: onClickFollowChallenge,
        iconURL: Strings.ic_heart_png,
        addBackBtn: true,
        addFollowChallengeText: true,
      ),
    );
  }
}

class SelectedChallengeArguments {
  final String challengeName;
  final String challengeDescription;
  final String challengePhotoRight;
  final String challengePhotoLeft;

  SelectedChallengeArguments(
      {required this.challengeName,
      required this.challengeDescription,
      required this.challengePhotoRight,
      required this.challengePhotoLeft});
}
