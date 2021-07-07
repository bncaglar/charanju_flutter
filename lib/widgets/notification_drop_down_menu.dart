import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/logic/cubit/notification_drop_down_cubit/notification_drop_down_cubit.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'icon_btn_as_image.dart';

class NotificationDropDownMenu extends StatefulWidget {
  @override
  _NotificationDropDownMenuState createState() =>
      _NotificationDropDownMenuState();
}

class _NotificationDropDownMenuState extends State<NotificationDropDownMenu> {
  String? dropDownValue;
  final log = Logger();

  onArrowClicked() {
    log.i("onArrowClicked started");
  }

  @override
  Widget build(BuildContext context) {
    List _dropDownItems = [
      S.of(context).followingFollowers,
      S.of(context).newVideosVictories,
      S.of(context).comments,
      S.of(context).messages,
      S.of(context).newChallengeRequest,
    ];
    return Container(
      width: 81.38.w,
      height: 5.62.h,
      color: AppColors.modalBottomSheetColor,
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton(
          setSelectedItemOffset: -5.65.h,
          icon: IconBtnAsPngImage(
            imageUrl: Strings.DROP_DOWN_ICON,
            onClickBtn: onArrowClicked,
            boxFit: BoxFit.cover,
          ),
          underline: Container(),
          hint: Text(
            S.of(context).allNotifications,
            style: TextStyle(
              fontSize: LocalHelper.getFontSize(15),
              color: AppColors.allNotificationsTextColor,
              fontWeight: FontWeight.w400,
              fontFamily: Strings.ARIAL,
            ),
          ),
          isExpanded: true,
          dropdownColor: AppColors.dropDownMenuColor,
          value: dropDownValue,
          onChanged: (value) {
            setState(() {
              dropDownValue = value as String?;
              changeStateOfNotificationScreen(dropDownValue);
            });
          },
          items: _dropDownItems.map(
            (value) {
              return DropdownMenuItem(
                value: value,
                child: dropDownTextItem(value),
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  AutoSizeText dropDownTextItem(value) {
    return AutoSizeText(
      value,
      style: TextStyle(
        fontSize: LocalHelper.getFontSize(15),
        color: AppColors.primaryWightColor,
        fontWeight: FontWeight.w400,
        fontFamily: Strings.ARIAL,
      ),
      textAlign: TextAlign.left,
    );
  }

  void changeStateOfNotificationScreen(dropDownValue) {
    if (dropDownValue == S.current.followingFollowers) {
      context
          .read<NotificationDropDownCubit>()
          .changeStep(FollowingAndFollowers());
    } else if (dropDownValue == S.current.newVideosVictories) {
      context
          .read<NotificationDropDownCubit>()
          .changeStep(NewVideosAndVictories());
    } else if (dropDownValue == S.current.comments) {
      context.read<NotificationDropDownCubit>().changeStep(Comments());
    } else if (dropDownValue == S.current.messages) {
      context.read<NotificationDropDownCubit>().changeStep(Messages());
    } else if (dropDownValue == S.current.newChallengeRequest) {
      context.read<NotificationDropDownCubit>().changeStep(
            NewChallengeRequests(),
          );
    }
  }
}
