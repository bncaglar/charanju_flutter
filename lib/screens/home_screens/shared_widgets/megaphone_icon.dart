import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MegaphoneIcon extends StatefulWidget {
  @override
  _MegaphoneIconState createState() => _MegaphoneIconState();
}

class _MegaphoneIconState extends State<MegaphoneIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.62.h, left: 1.093.w, right: 3.33.w),
      child: megaPhoneIcon(),
    );
  }

  Container megaPhoneIcon() {
    return Container(
      height: 3.75.h,
      width: 6.66.w,
      child: Image.asset(
        Strings.MEGAPHONE_ICON_PNG,
        fit: BoxFit.fill,
      ),
    );
  }
}
