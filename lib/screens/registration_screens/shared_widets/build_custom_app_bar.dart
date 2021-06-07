import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class CustomAppBarText extends StatefulWidget {
  String customText;
  CustomAppBarText(
      this.customText
      );
  @override
  _CustomAppBarTextState createState() => _CustomAppBarTextState();
}

class _CustomAppBarTextState extends State<CustomAppBarText> {
  final log = Logger();
  onClickBackBtn() {
    log.i("onClickBackBtn Started");
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildAddPhotoAppBar(context),
        ],
      ),
    );
  }
  Container buildAddPhotoAppBar(BuildContext context){
    return Container(
      padding: EdgeInsets.only(
        left: 5.449.w,
        right: 5.449.w,
        top: 1.244.h,
        bottom: 9.05.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildBackBtn(),
          Spacer(),
          buildTitle(context),
          Spacer(),
          Placeholder(
            fallbackWidth: 24.0,
            strokeWidth: 24.0,
            fallbackHeight: 24.0,
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }

  IconButton buildBackBtn() {
    return IconButton(
      onPressed: onClickBackBtn,
      icon: Icon(
        Icons.arrow_back_ios,
        color: AppColors.primaryWightColor,
        size: 17.sp,
      ),
    );
  }

  Container buildTitle(BuildContext context) {
    return Container(
        width: 44.25.w,
        child: AutoSizeText(
          this.widget.customText,
          style: TextStyle(
            fontSize: LocalHelper().getFontSize(15).sp,
            color: AppColors.primaryWightColor,
            fontWeight: FontWeight.w400,
            fontFamily: Strings.ARIAL,
          ),
          minFontSize: 12,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ));
  }

}
