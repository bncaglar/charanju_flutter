import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/logic/cubit/notification_drop_down_cubit/notification_drop_down_cubit.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterItem extends StatelessWidget {
  final String filterValue;

  const FilterItem({
    Key? key,
    required this.filterValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationDropDownCubit, NotificationDropDownState>(
      builder: (context, state) {
        if (filterValue == S.of(context).allNotifications) {
          return buildAllNotificationsFilterRow();
        }
        return buildText();
      },
    );
  }

  Row buildAllNotificationsFilterRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildText(),
        buildIcon(),
      ],
    );
  }

  Image buildIcon() {
    return Image.asset(
      Strings.IC_DROP_DOWN_ICON,
      height: 3.75.h,
      width: 6.66.w,
    );
  }

  AutoSizeText buildText() {
    return AutoSizeText(
      filterValue,
      style: TextStyle(
        fontSize: LocalHelper.getFontSize(15),
        color: AppColors.primaryWightColor,
        fontWeight: FontWeight.w400,
        fontFamily: Strings.C_ARIAL,
      ),
      textAlign: TextAlign.left,
    );
  }
}
