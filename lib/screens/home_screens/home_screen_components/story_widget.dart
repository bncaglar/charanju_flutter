import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class StoryWidget extends StatelessWidget {
  final String image;
  final String title;

  StoryWidget({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  final log = Logger();

  onClickStory() {
    log.i("onClickStory Started title:$title");
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClickStory,
      child: Container(
        padding: EdgeInsets.only(right: 5.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildStoryImage(),
            buildStoryTitle(),
          ],
        ),
      ),
    );
  }

  Container buildStoryImage() {
    return Container(
      height: 10.60.h,
      width: 15.5.w,
      padding: EdgeInsets.only(
        bottom: 1.w,
        top: 1.w,
      ),
      child: Image.asset(
        image,
        fit: BoxFit.fill,
      ),
    );
  }

  AutoSizeText buildStoryTitle() {
    return AutoSizeText(
      title,
      style: TextStyle(
        color: AppColors.primaryGreyColor,
        fontFamily: Strings.C_ARIAL,
        fontWeight: FontWeight.w400,
        fontSize: LocalHelper.getFontSize(10),
      ),
      minFontSize: 10,
    );
  }
}
