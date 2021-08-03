import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/widgets/form/chat_message_field.dart';
import 'package:charanju_flutter/widgets/icon_btn_as_image.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class ChatMessageFieldForm extends StatelessWidget {
  ChatMessageFieldForm({Key? key}) : super(key: key);

  final log = Logger();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController chatMessageController = TextEditingController();

  onClickArrowUp() {
    log.i("onClickArrowUp started");
  }

  onClickImagePlus() {
    log.i("onClickImagePlus started");
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.only(bottom: 2.65.h),
        height: 7.81.h,
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Row(
            children: [
              buildIcon(),
              buildField(),
            ],
          ),
        ),
      ),
    );
  }

  Container buildField() {
    return Container(
      height: 5.31.h,
      width: 81.1.w,
      child: ChatMessageField(
        controller: chatMessageController,
        onClickBtn: onClickArrowUp,
        iconPath: Strings.IC_ARROW_CIRCLE_UP_ICON,
      ),
    );
  }

  IconBtnAsPngImage buildIcon() {
    return IconBtnAsPngImage(
      imageUrl: Strings.IC_IMAGE_PLUS_ICON,
      onClickBtn: onClickImagePlus,
      boxFit: BoxFit.cover,
    );
  }
}
