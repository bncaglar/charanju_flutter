import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/icon_btn_as_image.dart';
import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class ChatMessageField extends StatefulWidget {
  final TextEditingController controller;
  final Function onClickBtn;
  final String iconPath;

  ChatMessageField({
    required this.controller,
    required this.onClickBtn,
    required this.iconPath,
  });

  @override
  _ChatMessageFieldState createState() => _ChatMessageFieldState();
}

class _ChatMessageFieldState extends State<ChatMessageField> {
  String? chatMessageValidator(String? value) {
    if (value!.isEmpty) {
      return S.of(context).aa;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      style: TextStyle(color: AppColors.primaryWightColor),
      validator: chatMessageValidator,
      labelText: S.of(context).aa,
      controller: widget.controller,
      autoValidateMode: AutovalidateMode.disabled,
      keyboardType: TextInputType.text,
      decoration: buildInputDecoration(context),
    );
  }

  InputDecoration buildInputDecoration(BuildContext context) {
    return InputDecoration(
      border: InputBorder.none,
      hintText: S.of(context).aa,
      filled: true,
      fillColor: AppColors.modalBottomSheetColor,
      suffixIcon: buildSuffixIcon(),
      hintStyle: TextStyle(color: AppColors.allNotificationsTextColor),
    );
  }

  IconBtnAsPngImage buildSuffixIcon() {
    return IconBtnAsPngImage(
      imageUrl: widget.iconPath,
      onClickBtn: () {
        widget.onClickBtn();
      },
      boxFit: BoxFit.contain,
    );
  }
}
