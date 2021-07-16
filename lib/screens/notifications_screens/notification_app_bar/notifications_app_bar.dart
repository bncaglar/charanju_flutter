import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/logger/simple_log_printer.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/avatar.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/widgets/form/search_challenges_field.dart';
import 'package:charanju_flutter/widgets/icon_btn_as_image.dart';
import 'package:charanju_flutter/widgets/notification_drop_down_menu/notification_drop_down_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  NotificationsAppBar({
    Key? key,
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
  }) : super(key: key);

  @override
  _NotificationsAppBarState createState() => _NotificationsAppBarState();
}

class _NotificationsAppBarState extends State<NotificationsAppBar> {
  TextEditingController searchController = TextEditingController();

  final log = getLogger();

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
        NotificationFilterDropDownMenu(),
        chatIconSection(),
      ],
    );
  }

  Row buildAppBarWithOutFilters() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget.addBackBtn ? buildLeading() : Container(),
        widget.addSearchField ? searchChallengesField() : Container(),
        SizedBox(
          width: 1.05.w,
        ),
        widget.addIconOnAppBar ? chatIconSection() : Container()
      ],
    );
  }

  IconBtnAsPngImage chatIconSection() {
    return IconBtnAsPngImage(
      onClickBtn: widget.onClickBtn!,
      imageUrl: widget.iconURL!,
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
    return SizedBox(width: 2.77.w);
  }

  Widget buildUserPhoto() {
    return widget.addUserPhoto
        ? NotificationAvatar(imagePath: widget.profilePicturePath!, radius: 18)
        : Container(width: 5.56.w);
  }

  Text buildUserName() {
    return Text(
      widget.username!,
      style: TextStyle(
        fontSize: LocalHelper.getFontSize(15),
        color: AppColors.primaryWightColor,
        fontWeight: FontWeight.w700,
        fontFamily: Strings.C_ARIAL,
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

  Container searchChallengesField() {
    return Container(
      width: widget.searchFieldWidth ?? 72.w,
      height: widget.searchFieldHeight ?? 5.62.h,
      child: SearchChallengesField(
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        addSearchFieldTitle: widget.addSearchFieldTitle,
        controller: searchController,
        serverSearchErrorText: null, //todo send server error here
      ),
    );
  }
}
