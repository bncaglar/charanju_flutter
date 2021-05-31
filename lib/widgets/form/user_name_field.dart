import 'package:charanju_flutter/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class UserNameField extends StatefulWidget {
  final String? serverUserNameErrorText;
  final TextEditingController controller;

  UserNameField({
    required this.controller,
    this.serverUserNameErrorText,
  });

  @override
  _UserNameFieldState createState() => _UserNameFieldState();
}

class _UserNameFieldState extends State<UserNameField> {
  String? userNameValidator(String? value) {
    S appLocalizations = S.of(context);

    if (value != null) {
      String firstChar = "";
      if (value.length > 0) {
        firstChar = value.substring(0, 1);
      }
      bool firstCharIsUpperCaseLetter =
          RegExp("(?=.*[A-Z])").hasMatch(firstChar);

      if (value.length == 0) {
        return appLocalizations.required;
      } else if (!firstCharIsUpperCaseLetter) {
        return appLocalizations.userNameStartWithCapitalLetter;
      }
    }

    if (widget.serverUserNameErrorText != null) {
      return widget.serverUserNameErrorText;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        validator: userNameValidator,
        labelText: S.of(context).userName,
        controller: widget.controller,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text);
  }
}
