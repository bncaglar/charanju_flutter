import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextLogo extends StatelessWidget {
  final EdgeInsetsGeometry? padding;

  const TextLogo({Key? key, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: Strings.T_SCREENS_TEXT_LOGO_TAG,
      child: Container(
        alignment: Alignment.center,
        padding: padding ??
            EdgeInsets.only(
              top: 14.31.h,
              left: 29.83.w,
              right: 30.11.w,
            ),
        child: Image.asset(
          Strings.IM_SCREENS_TEXT_LOGO_PNG,
        ),
      ),
    );
  }
}
