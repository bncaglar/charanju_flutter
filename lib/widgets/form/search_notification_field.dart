import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/widgets/icon_btn_as_image.dart';
import 'package:charanju_flutter/widgets/notification_drop_down_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'custom_text_field.dart';

class SearchNotificationField extends StatefulWidget {
  final String? serverSearchErrorText;
  final TextEditingController controller;
  final String? addSearchFieldTitle;
  final VoidCallback? onChanged;
  final VoidCallback? onEditingComplete;

  SearchNotificationField({
    required this.controller,
    this.serverSearchErrorText,
    this.addSearchFieldTitle,
    this.onChanged,
    this.onEditingComplete
  });

  @override
  _SearchNotificationFieldState createState() =>
      _SearchNotificationFieldState();
}

class _SearchNotificationFieldState extends State<SearchNotificationField> {
  final log = Logger();

  onArrowClicked() {
    log.i("onArrowClicked Started");
  }

  onClickSearchIcon() {
    log.i("onClickSearchIcon started");
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      prefixIcon: prefixIcon(),
      labelText: widget.addSearchFieldTitle ?? S.of(context).searchUser,
      controller: widget.controller,
      onEditingComplete: widget.onEditingComplete,
      fromRegistration: false,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      onChanged: widget.onChanged,
    );
  }

  IconBtnAsPngImage prefixIcon() {
    return IconBtnAsPngImage(
      imageUrl: Strings.SEARCH_ICON_PNG,
      onClickBtn: onClickSearchIcon,
      boxFit: BoxFit.contain,
    );
  }
}
