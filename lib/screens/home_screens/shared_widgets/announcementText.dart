import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

// ignore: must_be_immutable
class AnnouncementText extends StatefulWidget {
  String announcementText;

  AnnouncementText({required this.announcementText});

  @override
  _AnnouncementTextState createState() => _AnnouncementTextState();
}

class _AnnouncementTextState extends State<AnnouncementText> {
  final log = Logger();

  onClickAnnouncementText() {
    log.i("onClickAnnouncementText started");
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClickAnnouncementText();
      },
      child: announcementText(),
    );
  }

  AutoSizeText announcementText() {
    return AutoSizeText(
      widget.announcementText,

      ///todo Announcement text
      style: TextStyle(
        fontSize: LocalHelper.getFontSize(13),
        color: AppColors.primaryWightColor,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
