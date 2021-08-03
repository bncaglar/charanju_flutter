import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/logger/simple_log_printer.dart';
import 'package:charanju_flutter/screens/home_screens/home_screen_components/one_backgroung_split_image.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_app_bar/notifications_app_bar.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/icon_btn_as_image.dart';
import 'package:charanju_flutter/widgets/text_btn.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChallengeSplitImages extends StatefulWidget {
  static const routeName = '/ChallengeSplitImages';
  final String? challengeName;
  final String? leftPhoto;
  final String? rightPhoto;

  ChallengeSplitImages(
      {Key? key,
      required this.challengeName,
      required this.rightPhoto,
      required this.leftPhoto})
      : super(key: key);

  @override
  _ChallengeSplitImagesState createState() => _ChallengeSplitImagesState();
}

class _ChallengeSplitImagesState extends State<ChallengeSplitImages> {
  final log = getLogger();

  onClickBtn() {
    ///TODO  add the beck-end Functionality
    log.i("onClickBtn started");
  }

  onClickChallengeName() {
    log.i("onClickChallengeName started");
  }

  onClickAnnouncementText() {
    log.i("onClickAnnouncementText started");
  }

  onClickFollowChallenge() {
    log.i("onClickFollowChallenge started");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundPrimaryColor,
        appBar: buildSelectedChallengeAppBar(),
        body: buildBackgroundImage(),
      ),
    );
  }

  Stack buildBackgroundImage() {
    return Stack(
      children: [
        buildBackgroundTwoImages(),
        buildSecondRowHashTagText(),
      ],
    );
  }

  Container buildSecondRowHashTagText() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildPointsText(),
          buildTitleHashTagText(),
          buildShareIcon(),
        ],
      ),
    );
  }

  IconBtnAsPngImage buildShareIcon() {
    return IconBtnAsPngImage(
      imageUrl: Strings.IC_SHARE_ICON_PNG,
      onClickBtn: onClickBtn,
    );
  }

  TextBtn buildTitleHashTagText() {
    return TextBtn(
      text: Strings.P_HASH_SAMPLE + widget.challengeName!,
      onClickText: onClickChallengeName,
    );
  }

  TextBtn buildPointsText() {
    return TextBtn(
      text: "180" + Strings.C_LETTER_P,
    );
  }

  Container buildBackgroundTwoImages() {
    return Container(
      color: AppColors.primaryWightColor,
      child: Row(
        children: [
          leftImage(),
          rightImage(),
        ],
      ),
    );
  }

  Expanded leftImage() {
    return Expanded(
      flex: 50,
      child: OneBackgroundSplitImage(
        imagePath: widget.leftPhoto!,
        rightImage: false,
        leftImage: true,
      ),
    );
  }

  Expanded rightImage() {
    return Expanded(
      flex: 50,
      child: OneBackgroundSplitImage(
        imagePath: widget.rightPhoto!,
        rightImage: true,
        leftImage: false,
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

class ChallengeSplitImagesArguments{
  final String? challengeName;
  final String? leftPhoto;
  final String? rightPhoto;

  ChallengeSplitImagesArguments(
      {required this.challengeName,
      required this.rightPhoto,
      required this.leftPhoto});
}
