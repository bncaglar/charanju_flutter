import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/widgets/icon_btn_as_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'custom_text_field.dart';

class SearchNotificationField extends StatefulWidget {
  final String? serverSearchErrorText;
  final TextEditingController controller;

  SearchNotificationField({
    required this.controller,
    this.serverSearchErrorText,
  });

  @override
  _SearchNotificationFieldState createState() =>
      _SearchNotificationFieldState();
}

class _SearchNotificationFieldState extends State<SearchNotificationField> {
  final log = Logger();

  onEditingComplete() {
    log.i("onEditingComplete Started");
  }

  onArrowClicked() {
    log.i("onArrowClicked Started");
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: S.of(context).allNotifications,
      controller: widget.controller,
      onEditingComplete: onEditingComplete,
      fromRegistration: false,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      suffixIcon: IconBtnAsPngImage(
        imageUrl: Strings.DROP_DOWN_ICON,
        onClickBtn: onArrowClicked,
        boxFit: BoxFit.cover,
      ),
    );
  }
}
