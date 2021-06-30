import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';

class BiographyContent extends StatelessWidget {
  final String content;
  final VoidCallback onClick;
  final EdgeInsetsGeometry? padding;

  const BiographyContent({
    Key? key,
    required this.content,
    required this.onClick,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: InkWell(
        onTap: () {
          onClick();
        },
        child: Text(
          content,
          style: TextStyle(
            fontSize: LocalHelper.getFontSize(12),
            color: AppColors.primaryWightColor,
            fontWeight: FontWeight.w400,
            fontFamily: Strings.ARIAL,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
