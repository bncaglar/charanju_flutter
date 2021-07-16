import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/logic/cubit/profile_tab_selscted_cubit/profile_tab_selected_cubit.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class ProfileTabs extends StatefulWidget {
  final String tapIcon;
  final bool tabSelected;

  ProfileTabs({
    required this.tapIcon,
    required this.tabSelected,
  });

  @override
  _ProfileTabsState createState() => _ProfileTabsState();
}

class _ProfileTabsState extends State<ProfileTabs> {
  final log = Logger();

  onClickTheTap() {
    log.i("onClickTheTap Started");
    if (widget.tapIcon == Strings.IC_TROPHY_ICON) {
      log.i("ProfileTabSelected");
      context
          .read<ProfileTabSelectedCubit>()
          .changeProfileTab(profileTabSelectedState: ProfileTabSelected());
    } else if (widget.tapIcon == Strings.IC_BALANCE_SCALE_ICON) {
      log.i("JudgeTabSelected");
      context
          .read<ProfileTabSelectedCubit>()
          .changeProfileTab(profileTabSelectedState: JudgeTabSelected());
    } else {
      log.i("BetTabSelected");
      context
          .read<ProfileTabSelectedCubit>()
          .changeProfileTab(profileTabSelectedState: BetTabSelected());
    }
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
          widget.tapIcon,
          color: widget.tabSelected
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
      border: widget.tabSelected
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
