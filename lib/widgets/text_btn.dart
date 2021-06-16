import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';

class TextBtn extends StatelessWidget {
  final String text;
  final double? textSize;
  final FontWeight? fontWeight;
  final VoidCallback? onClickText;
  final TextAlign? textAlign;
  const TextBtn({
    Key? key,
    required this.text,
    this.textSize,
    this.fontWeight,
    this.onClickText,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClickText ?? () {},
      child: AutoSizeText(
        text,
        style: TextStyle(
          fontSize: LocalHelper.getFontSize(textSize ?? 15),
          color: AppColors.primaryWightColor,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontFamily: Strings.ARIAL,
        ),
        minFontSize: textSize ?? 15,
        textAlign: textAlign ?? null,
      ),
    );
  }
}
