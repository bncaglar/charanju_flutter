import 'package:charanju_flutter/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class BirthdayField extends StatefulWidget {
  final String? serverBirthdayErrorText;
  final TextEditingController controller;

  BirthdayField({
    required this.controller,
    this.serverBirthdayErrorText,
  });

  @override
  _BirthdayFieldState createState() => _BirthdayFieldState();
}

class _BirthdayFieldState extends State<BirthdayField> {
  String? birthdayValidator(String? value) {
    S appLocalizations = S.of(context);

    if (value != null) {
      if (value.length == 0) {
        return appLocalizations.required;
      }
      if (value.indexOf("/") != 2) {
        return appLocalizations.wrongFormat;
      }
      if (value.lastIndexOf("/") != 5) {
        return appLocalizations.wrongFormat;
      }
      if (value.length != 10) {
        return appLocalizations.wrongFormat;
      }
    }

    if (widget.serverBirthdayErrorText != null) {
      return widget.serverBirthdayErrorText;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        validator: birthdayValidator,
        labelText: S.of(context).birthday,
        controller: widget.controller,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.datetime);
  }
}
