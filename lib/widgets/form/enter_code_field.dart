import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class EnterCodeField extends StatefulWidget {
  final String? serverCodeErrorText;
  final TextEditingController controller;

  EnterCodeField({
    required this.controller,
    this.serverCodeErrorText,
  });

  @override
  _EnterCodeFieldState createState() => _EnterCodeFieldState();
}

class _EnterCodeFieldState extends State<EnterCodeField> {
  String? codeValidator(String? value) {
    String pattern = Strings.EMAIL_PATTERN; //code pattern
    RegExp regExp = new RegExp(pattern);

    if (!regExp.hasMatch(value!.trim())) {
      return widget.serverCodeErrorText ?? S.of(context).invalidCode;
    }
    return widget.serverCodeErrorText;
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        validator: codeValidator,
        labelText: S.of(context).code,
        controller: widget.controller,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        //keyboard type?
    );
  }
}
