import 'package:charanju_flutter/screens/notifications_screens/notification_app_bar/notifications_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NotificationAppBarBuilder extends StatefulWidget
    implements PreferredSizeWidget {
  final bool? addBackBtn;
  final bool? addSearchField;
  final bool? addIconOnAppBar;
  final bool? addUserPhoto;
  final bool? addUserName;
  final bool? addFilterMenu;
  final String? iconURL;
  final String? username;
  final String? addSearchFieldTitle;
  final String? profilePicturePath;
  final String? searchFieldTitle;
  final double? searchFieldHeight;
  final double? searchFieldWidth;
  final VoidCallback? onClickBtn;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onChanged;

  NotificationAppBarBuilder({
    Key? key,
    this.addBackBtn,
    this.addSearchField,
    this.addIconOnAppBar,
    this.addUserPhoto,
    this.addUserName,
    this.addFilterMenu,
    this.iconURL,
    this.onEditingComplete,
    this.onChanged,
    this.username,
    this.addSearchFieldTitle,
    this.profilePicturePath,
    this.searchFieldHeight,
    this.searchFieldWidth,
    this.searchFieldTitle,
    this.onClickBtn,
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize;

  @override
  _NotificationAppBarBuilderState createState() =>
      _NotificationAppBarBuilderState();
}

class _NotificationAppBarBuilderState extends State<NotificationAppBarBuilder> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(7.5.h),
      child: NotificationsAppBar(
        addSearchField: widget.addSearchField!,
        addBackBtn: widget.addBackBtn!,
        addIconOnAppBar: widget.addIconOnAppBar!,
        addUserPhoto: widget.addUserPhoto!,
        addUserName: widget.addUserName!,
        addFilterMenu: widget.addFilterMenu!,
        onClickBtn: widget.onClickBtn,
        iconURL: widget.iconURL,
        onEditingComplete: widget.onEditingComplete,
        onChanged: widget.onChanged,
        username: widget.username,
        addSearchFieldTitle: widget.addSearchFieldTitle,
        profilePicturePath: widget.profilePicturePath,
        searchFieldHeight: widget.searchFieldHeight,
        searchFieldTitle: widget.searchFieldTitle,
        searchFieldWidth: widget.searchFieldWidth,
      ),
    );
  }
}
