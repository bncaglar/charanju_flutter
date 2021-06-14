import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class ProfileTabs extends StatelessWidget {
  final String tapIcon;
  final bool tabSelected;

  ProfileTabs({
    required this.tapIcon,
    required this.tabSelected,
  });

  final log = Logger();

  onClickTheTap() {
    log.i("onClickTheTap Started");
  }

  @override
  Widget build(BuildContext context) {
    return buildIconButton();
  }

  Container buildIconButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 1.71.h),
      decoration: buildBottomBorder(),
      child: IconButton(
        icon: Image.asset(
          tapIcon,
          color: tabSelected
              ? AppColors.primaryWightColor
              : AppColors.secondaryGrayColor,
          height: 5.h,
          width: 6.65.w,
        ),
        onPressed: onClickTheTap,
      ),
    );
  }

  BoxDecoration buildBottomBorder() {
    return BoxDecoration(
      border: tabSelected
          ? Border(
              bottom: BorderSide(
                width: 1.5,
                color: AppColors.primaryWightColor,
              ),
            )
          : null,
    );
  }
}
