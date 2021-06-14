import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IconDividerColumn extends StatelessWidget {
  final String icon;
  final Function iconOnClick;
  final bool pressed;

  IconDividerColumn({
    required this.icon,
    required this.iconOnClick,
    required this.pressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildIconButton(),
        buildDivider(),
      ],
    );
  }

  Visibility buildDivider() {
    return Visibility(
      visible: pressed,
      child: Divider(
        color: AppColors.primaryWightColor,
        thickness: 2,
        indent: 5,
      ),
    );
  }

  IconButton buildIconButton() {
    return IconButton(
        icon: Image.asset(
          icon,
          color: pressed
              ? AppColors.primaryWightColor
              : AppColors.secondaryGrayColor,
          height: 5.h,
          width: 6.65.w,
        ),
        onPressed: iconOnClick());
  }
}
