import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/screens/home_screens/home_screen_components/one_backgroung_split_image.dart';
import 'package:charanju_flutter/widgets/text_btn.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/icon_btn_as_image.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class HomeBodyList extends StatefulWidget {
  const HomeBodyList({Key? key}) : super(key: key);

  @override
  _HomeBodyListState createState() => _HomeBodyListState();
}

class _HomeBodyListState extends State<HomeBodyList> {
  final log = Logger();

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

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          // todo get the data from the API and refactor this widget as the following example:
          ///final ObjectType object=getObjectFromServerByID(index);
          return SizedBox(
            height: 85.h,
            child: buildBackgroundImage(),
          );
        },
        childCount: 7, //todo use the  length the Object Challenges list
      ),
    );
  }

  Stack buildBackgroundImage() {
    return Stack(
      children: [
        buildBackgroundTwoImages(),
        buildFirstRowText(),
        buildSecondRowHashTagText(),
      ],
    );
  }

  Container buildFirstRowText() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildIMegaPhoneIcon(),
          buildAnnouncementText(),
        ],
      ),
    );
  }

  IconBtnAsPngImage buildIMegaPhoneIcon() {
    return IconBtnAsPngImage(
      imageUrl: Strings.IC_MEGAPHONE_ICON_PNG,
      onClickBtn: onClickBtn,
    );
  }

  Expanded buildAnnouncementText() {
    return Expanded(
      child: TextBtn(
        text: S.of(context).announcementText,
        onClickText: onClickAnnouncementText,
        textSize: 13,
        textAlign: TextAlign.center,
      ),
    );
  }

  Container buildSecondRowHashTagText() {
    return Container(
      padding: EdgeInsets.only(
        top: 5.78.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildPointsText(),
          buildTitleHashtagText(),
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

  TextBtn buildTitleHashtagText() {
    return TextBtn(
      text: Strings.P_HASH_SAMPLE + "outdoorchallenge",
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
        imagePath: Strings.IM_LeftExamplePhoto,
        rightImage: false,
        leftImage: true,
      ),
    );
  }

  Expanded rightImage() {
    return Expanded(
      flex: 50,
      child: OneBackgroundSplitImage(
        imagePath: Strings.IM_RightExamplePhoto,
        rightImage: true,
        leftImage: false,
      ),
    );
  }
}
