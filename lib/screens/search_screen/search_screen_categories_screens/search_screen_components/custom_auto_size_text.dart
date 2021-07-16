import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';

class SearchScreenCustomAutoSizeText extends StatefulWidget {
  final String? content;
  final String? fontFamily;

  SearchScreenCustomAutoSizeText({required this.content, this.fontFamily});

  @override
  _SearchScreenCustomAutoSizeTextState createState() =>
      _SearchScreenCustomAutoSizeTextState();
}

class _SearchScreenCustomAutoSizeTextState
    extends State<SearchScreenCustomAutoSizeText> {
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      widget.content!,
      style: TextStyle(
        fontSize: LocalHelper.getFontSize(15),
        color: AppColors.primaryGreyColor,
        fontWeight: FontWeight.w400,
        fontFamily: widget.fontFamily ?? Strings.C_ARIAL,
      ),
    );
  }
}
