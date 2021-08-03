import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/logic/cubit/notification_drop_down_cubit/notification_drop_down_cubit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownMenuIcon extends StatelessWidget {
  final String? dropDownValue;

  const DropDownMenuIcon({
    Key? key,
    required this.dropDownValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationDropDownCubit, NotificationDropDownState>(
      builder: (context, state) {
        if (dropDownValue == null && state is AllNotifications) {
          return buildIcon();
        }
        if (state is AllNotifications) {
          return Container();
        }
        return buildIcon();
      },
    );
  }

  Image buildIcon() {
    return Image.asset(
      Strings.IC_DROP_DOWN_ICON,
      height: 3.75.h,
      width: 6.66.w,
    );
  }
}
