import 'package:charanju_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class CodeField extends StatefulWidget {
  final String? serverCodeErrorText;
  final TextEditingController controller;

  CodeField({
    required this.controller,
    this.serverCodeErrorText,
  });

  @override
  _CodeFieldState createState() => _CodeFieldState();
}

class _CodeFieldState extends State<CodeField> {
  String? codeValidator(String? value) {
    if (value!.isEmpty) {
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
      keyboardType: TextInputType.text,
    );
  }
}
