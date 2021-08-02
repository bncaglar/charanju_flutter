import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/avatar.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/form/search_notification_field.dart';
import 'package:charanju_flutter/widgets/icon_btn_as_image.dart';
import 'package:charanju_flutter/widgets/notification_drop_down_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class NotificationsAppBar extends StatefulWidget {
  final VoidCallback? onClickBtn;
  final String? iconURL;
  final bool addFilterMenu;
  final bool addUserName;
  final String? profilePicturePath;
  final bool addUserPhoto;
  final bool addIconOnAppBar;
  final String? username;
  final bool addBackBtn;
  final bool addSearchField;
  final String? searchFieldTitle;
  final String? addSearchFieldTitle;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onChanged;
  final double? searchFieldHeight;
  final double? searchFieldWidth;
  final bool? addFollowChallengeText;

  NotificationsAppBar(
      {Key? key,
      this.onClickBtn,
      this.iconURL,
      required this.addFilterMenu,
      required this.addUserName,
      this.profilePicturePath,
      required this.addUserPhoto,
      required this.addIconOnAppBar,
      this.username,
      required this.addBackBtn,
      required this.addSearchField,
      this.searchFieldTitle,
      this.addSearchFieldTitle,
      this.onChanged,
      this.onEditingComplete,
      this.searchFieldHeight,
      this.searchFieldWidth,
      required this.addFollowChallengeText})
      : super(key: key);

  @override
  _NotificationsAppBarState createState() => _NotificationsAppBarState();
}

class _NotificationsAppBarState extends State<NotificationsAppBar> {
  TextEditingController searchController = TextEditingController();

  final log = Logger();

  onClickBackBtn() {
    log.i("onClickBackBtn started");
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        right: 2.5.w,
      ),
      child: widget.addFilterMenu
          ? buildAppBarWithFilters()
          : buildAppBarWithOutFilters(),
    );
  }

  Row buildAppBarWithFilters() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget.addBackBtn ? buildBackBtn() : Container(),
        dropDownMenuField(),
        chatIconSection(),
      ],
    );
  }

  Row buildAppBarWithOutFilters() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget.addBackBtn ? buildLeading() : Container(),
        widget.addSearchField ? searchNotificationsField() : Container(),
        SizedBox(
          width: 1.05.w,
        ),
        widget.addIconOnAppBar ? chatIconSection() : Container()
      ],
    );
  }

  Widget dropDownMenuField() {
    return NotificationDropDownMenu();
  }

  Row chatIconSection() {
    return Row(
      children: [
        addFollowChallengeText(),
        IconBtnAsPngImage(
          onClickBtn: widget.onClickBtn!,
          imageUrl: widget.iconURL!,
          // boxFit: BoxFit.contain,
        ),
      ],
    );
  }

  Row userProfileData() {
    return Row(
      children: [
        buildUserPhoto(),
        buildPadding(),
        buildUserName(),
      ],
    );
  }

  SizedBox buildPadding() {
    return SizedBox(
      width: 2.77.w,
    );
  }

  Container addFollowChallengeText() {
    return widget.addFollowChallengeText!
        ? Container(
            width: 28.27.w,
            height: 2.8.h,
            child: Text(
              S.of(context).followChallenge,
              style: TextStyle(
                fontSize: LocalHelper.getFontSize(13),
                color: AppColors.primaryWightColor,
                fontWeight: FontWeight.w400,
                fontFamily: Strings.ARIAL,
              ),
            ),
          )
        : Container();
  }

  Widget buildUserPhoto() {
    return widget.addUserPhoto
        ? NotificationAvatar(imagePath: widget.profilePicturePath!, radius: 18)
        : Container(
            width: 5.56.w,
          );
  }

  Text buildUserName() {
    return Text(
      widget.username!,
      style: TextStyle(
        fontSize: LocalHelper.getFontSize(15),
        color: AppColors.primaryWightColor,
        fontWeight: FontWeight.w700,
        fontFamily: Strings.ARIAL,
      ),
    );
  }

  Row buildLeading() {
    return Row(
      children: [
        buildBackBtn(),
        widget.addUserName ? userProfileData() : Container(),
      ],
    );
  }

  IconButton buildBackBtn() {
    return IconButton(
      onPressed: () {
        onClickBackBtn();
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: AppColors.primaryWightColor,
        size: 17.sp,
      ),
    );
  }

  Container searchNotificationsField() {
    return Container(
      width: widget.searchFieldWidth ?? 72.w,
      height: widget.searchFieldHeight ?? 5.62.h,
      child: SearchNotificationField(
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        addSearchFieldTitle: widget.addSearchFieldTitle,
        controller: searchController,
        serverSearchErrorText: null, //todo send server error here
      ),
    );
  }
}
