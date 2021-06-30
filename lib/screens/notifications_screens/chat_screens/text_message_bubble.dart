import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/helper/modules/chat_module.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextMessageBubble extends StatelessWidget {
  final String message;
  final ChatModule item;

  const TextMessageBubble({
    Key? key,
    required this.message,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.modalBottomSheetColor),
      constraints:
          BoxConstraints(minWidth: 65.2.w, maxWidth: 65.2.w, minHeight: 7.34.h),
      child: Align(
        alignment:
            !item.isOwnMessage ? Alignment.centerLeft : Alignment.centerRight,
        child: Padding(
          padding: !item.isOwnMessage
              ? EdgeInsets.only(
                  left: 3.33.w, top: 0.93.h, bottom: 0.93.h, right: 1.32.w)
              : EdgeInsets.only(
                  right: 2.22.w, top: 0.93.h, bottom: 0.93.h, left: 3.61.w),
          child: AutoSizeText(
            message,
            style: TextStyle(
              fontSize: LocalHelper.getFontSize(15),
              color: AppColors.primaryWightColor,
              fontWeight: FontWeight.w700,
              fontFamily: Strings.ARIAL,
            ),
            maxLines: 8,
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
