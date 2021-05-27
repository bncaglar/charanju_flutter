import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class EmailField extends StatefulWidget {
  final String? serverEmailErrorText;
  final TextEditingController controller;

  EmailField({
    required this.controller,
    this.serverEmailErrorText,
  });

  @override
  _EmailFieldState createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  String? emailValidator(String? value) {
    String pattern = Strings.EMAIL_PATTERN;
    RegExp regExp = new RegExp(pattern);

    if (!regExp.hasMatch(value!.trim())) {
      return widget.serverEmailErrorText ?? S.of(context).invalidEmailAddress;
    }
    return widget.serverEmailErrorText;
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        validator: emailValidator,
        labelText: S.of(context).email,
        controller: widget.controller,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.emailAddress);
  }
}
