import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class ReplyIcon extends StatefulWidget {
  @override
  _ReplyIconState createState() => _ReplyIconState();
}

class _ReplyIconState extends State<ReplyIcon> {
  final log = Logger();

  onClickReplyIcon() {
    log.i("onClickReplyIcon started");

    ///TODO  REPLY TO THE CHALLENGE
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0.h, right: 2.22.w),
      child: reply(),
    );
  }

  InkWell reply() {
    return InkWell(
      onTap: () {
        onClickReplyIcon();
      },
      child: replyIcon(),
    );
  }

  Container replyIcon() {
    return Container(
      height: 3.75.h,
      width: 6.66.w,
      child: Image.asset(
        Strings.SHARE_ICON_PNG,
        fit: BoxFit.fill,
      ),
    );
  }
}
