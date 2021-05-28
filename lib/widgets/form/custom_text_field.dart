import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatefulWidget {
  final String? Function(String?)? validator;
  final AutovalidateMode autoValidateMode;
  final String? labelText;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;

  CustomTextFormField({
    this.validator,
    this.autoValidateMode = AutovalidateMode.disabled,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        obscureText: widget.obscureText ?? false,
        validator: widget.validator,
        autovalidateMode: widget.autoValidateMode,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          fontSize: 15.sp,
          fontStyle: FontStyle.normal,
          fontFamily: Strings.ABSOLUTE,
          color: AppColors.textPrimaryColor,
        ),
        decoration: buildInputDecoration(),
      ),
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      filled: true,
      fillColor: AppColors.backgroundPrimaryColor,
      labelText: widget.labelText,
      focusColor: AppColors.primaryColor,
      suffixIcon: widget.suffixIcon ?? null,
      errorStyle: TextStyle(
        fontSize: 8.57.sp,
      ),
      contentPadding: EdgeInsets.only(
        left: 1.7.w,
        bottom: 1.44.w,
      ),
      labelStyle: TextStyle(
        fontSize: 15.4.sp,
        fontStyle: FontStyle.normal,
        fontFamily: Strings.ABSOLUTE,
        color: AppColors.textPrimaryColor,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.errorColor,
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.errorColor,
        ),
      ),
    );
  }
}
