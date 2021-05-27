import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController? confirmPasswordController;
  final String labelText;
  final String? passwordServerError;

  PasswordField(
      {required this.controller,
      this.confirmPasswordController,
      this.passwordServerError,
      required this.labelText});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isPasswordVisible = false;

  String? passwordValidator(String? value) {
    S appLocalizations = S.of(context);

    if (value != null) {
      bool hasOneUpperCaseLetter = RegExp("(?=.*[A-Z])").hasMatch(value);
      bool hasOneNumber = RegExp(".*[0-9].*").hasMatch(value);
      bool hasOneSpecialCharacter = RegExp(".[`@#!%\$&^*()].*").hasMatch(value);

      if (value.length == 0) {
        return appLocalizations.required;
      } else if (value.length <= 6) {
        return appLocalizations.passwordMinimumLength;
      } else if (!hasOneUpperCaseLetter) {
        return appLocalizations.passwordOneUppercase;
      } else if (!hasOneNumber) {
        return appLocalizations.passwordOneNumber;
      } else if (!hasOneSpecialCharacter) {
        return appLocalizations.passwordOneSpecialCharacter;
      } else if (widget.confirmPasswordController != null &&
          (widget.confirmPasswordController!.text != widget.controller.text)) {
        return appLocalizations.confirmationDoesNotMatch;
      }
    }

    if (widget.passwordServerError != null) {
      return widget.passwordServerError;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      labelText: widget.labelText,
      validator: passwordValidator,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      obscureText: isPasswordVisible ? false : true,
      suffixIcon: IconButton(
        icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
        color: AppColors.textPrimaryColor,
        onPressed: () {
          setState(
            () {
              isPasswordVisible = !isPasswordVisible;
            },
          );
        },
      ),
    );
  }
}
