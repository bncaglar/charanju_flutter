import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/logger/simple_log_printer.dart';
import 'package:charanju_flutter/logic/cubit/notification_drop_down_cubit/notification_drop_down_cubit.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/notification_drop_down_menu/drop_down_item.dart';
import 'package:charanju_flutter/widgets/notification_drop_down_menu/drop_down_menu_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationFilterDropDownMenu extends StatefulWidget {
  @override
  _NotificationFilterDropDownMenuState createState() =>
      _NotificationFilterDropDownMenuState();
}

class _NotificationFilterDropDownMenuState
    extends State<NotificationFilterDropDownMenu> {
  String? dropDownValue;
  final log = getLogger();
  List _dropDownItems = [
    S.current.allNotifications,
    S.current.followingFollowers,
    S.current.newVideosVictories,
    S.current.comments,
    S.current.messages,
    S.current.newChallengeRequest,
  ];

  void changeNotificationFilterScreen({required String? dropDownValue}) {
    log.i("changeNotificationFilterScreen Started");
    if (dropDownValue == null) {
      context
          .read<NotificationDropDownCubit>()
          .changeFilterOption(AllNotifications());
    } else if (dropDownValue == S.current.allNotifications) {
      context
          .read<NotificationDropDownCubit>()
          .changeFilterOption(AllNotifications());
    } else if (dropDownValue == S.current.followingFollowers) {
      context
          .read<NotificationDropDownCubit>()
          .changeFilterOption(FollowingAndFollowers());
    } else if (dropDownValue == S.current.newVideosVictories) {
      context
          .read<NotificationDropDownCubit>()
          .changeFilterOption(NewVideosAndVictories());
    } else if (dropDownValue == S.current.comments) {
      context.read<NotificationDropDownCubit>().changeFilterOption(Comments());
    } else if (dropDownValue == S.current.messages) {
      context.read<NotificationDropDownCubit>().changeFilterOption(Messages());
    } else if (dropDownValue == S.current.newChallengeRequest) {
      context.read<NotificationDropDownCubit>().changeFilterOption(
            NewChallengeRequests(),
          );
    }
  }

  onChanged(value) {
    log.i("onChanged Started");
    setState(() {
      dropDownValue = value as String?;
    });
    changeNotificationFilterScreen(dropDownValue: value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 81.38.w,
      height: 5.62.h,
      color: AppColors.modalBottomSheetColor,
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton(
          icon: DropDownMenuIcon(
            dropDownValue: dropDownValue,
          ),
          underline: Container(),
          hint: buildStartedFilterText(context),
          isExpanded: true,
          dropdownColor: AppColors.dropDownMenuColor,
          value: dropDownValue,
          onChanged: onChanged,
          items: buildList(_dropDownItems),
        ),
      ),
    );
  }

  List<DropdownMenuItem<Object>> buildList(List<dynamic> _dropDownItems) {
    return _dropDownItems.map(
      (value) {
        return DropdownMenuItem(
          value: value,
          child: FilterItem(filterValue: value),
        );
      },
    ).toList();
  }

  BlocBuilder buildStartedFilterText(BuildContext context) {
    return BlocBuilder<NotificationDropDownCubit, NotificationDropDownState>(
      builder: (context, state) {
        return Text(
          state.filterName,
          style: TextStyle(
            fontSize: LocalHelper.getFontSize(15),
            color: AppColors.allNotificationsTextColor,
            fontWeight: FontWeight.w400,
            fontFamily: Strings.C_ARIAL,
          ),
        );
      },
    );
  }
}
