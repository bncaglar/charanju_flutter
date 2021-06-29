import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/helper/modules/notification_module.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';

class NotificationScreenTimeField extends StatefulWidget {
  final NotificationModule item;

  NotificationScreenTimeField({required this.item});

  @override
  _NotificationScreenTimeFieldState createState() =>
      _NotificationScreenTimeFieldState();
}

class _NotificationScreenTimeFieldState
    extends State<NotificationScreenTimeField> {
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      ///todo timer will come from API
      widget.item.receivedTime,
      style: TextStyle(
        fontSize: LocalHelper.getFontSize(12),
        color: AppColors.textPrimaryColor,
        fontWeight: FontWeight.w400,
        fontFamily: Strings.ARIAL,
      ),
    );
  }
}
