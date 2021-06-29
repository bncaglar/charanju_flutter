import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/helper/modules/conversation_module.dart';
import 'package:charanju_flutter/screens/notifications_screens/conversations_screens/conversation_data/conversation_data.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/avatar.dart';
import 'package:charanju_flutter/screens/notifications_screens/profile_of_another_user_screen/profile_of_another_user.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/notifications_app_bar.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class ConversationPageScreen extends StatefulWidget {
  static const routeName = '/ConversationPageScreen';
  final String? urlAvatar;
  final String? username;

  const ConversationPageScreen({Key? key, this.urlAvatar, this.username})
      : super(key: key);

  @override
  _ConversationPageScreenState createState() => _ConversationPageScreenState();
}

class _ConversationPageScreenState extends State<ConversationPageScreen> {
  final log = Logger();
  List<ConversationModule> items = List.of(ConversationData.conversations);
  final listViewController = ScrollController();
  onClickInfoIcon() {
    log.i("onClickInfoIcon started");
    Navigator.pushNamed(context, ProfileOfAnotherUser.routeName,
        arguments: ProfileOfAnotherUserArguments(
            urlAvatar: widget.urlAvatar!, username: widget.username!));
  }

  onClickImagePlus() {
    log.i("onClickImagePlus started");
  }

  onClickArrowUp() {
    log.i("onClickArrowUp started");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.5.h),
          child: NotificationsAppBar(
            username: widget.username,
            addIconOnAppBar: true,
            addUserPhoto: true,
            profilePicturePath: widget.urlAvatar,
            addUserName: true,
            addSearchField: false,
            onClickBtn: onClickInfoIcon,
            iconURL: Strings.COMMENT_INFO_ICON,
          ),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundPrimaryColor,
        body: conversationPageUi(context, onClickImagePlus, onClickArrowUp,
            items, widget.urlAvatar!,listViewController),
      ),
    );
  }
}

Widget conversationPageUi(BuildContext context, VoidCallback onClickBtn,
    VoidCallback onClickArrow, items, String urlAvatar,listViewController) {
  return Builder(
    builder: (BuildContext _context) {
      return Stack(
        children: <Widget>[
          messageListView(items, urlAvatar,listViewController),
          Align(
            alignment: Alignment.bottomCenter,
            child: messageField(context, onClickBtn, onClickArrow),
          )
        ],
      );
    },
  );
}

Widget messageListView(items, String urlAvatar,listViewController ) {
  Timer(
      Duration(milliseconds: 50),
          () => {
        listViewController
            .jumpTo(listViewController.position.maxScrollExtent),
      });
  return Container(
    padding: EdgeInsets.only(
        bottom: 7.81.h
    ),
    decoration: BoxDecoration(color: AppColors.backgroundPrimaryColor),
    child: ListView.builder(
      controller: listViewController,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return messageListViewChild(item, urlAvatar);
      },
    ),
  );
}

Widget messageListViewChild(items, String urlAvatar) {
  return Padding(
    padding: EdgeInsets.only(bottom: 0.93.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment:
          items.isOwnMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 4.72.w,
        ),
        !items.isOwnMessage ? userImage(urlAvatar) : Container(),
        SizedBox(width: 1.66.w),
        _textMessageBubble(items.messages, items),
        SizedBox(width: 1.66.w),
        !items.isOwnMessage
            ? Container()
            : userImage(Strings.NOTIFICATION_AVATAR_2),
        SizedBox(
          width: 4.72.w,
        ),
      ],
    ),
  );
}

Widget _textMessageBubble(_message, items) {
  return Container(
    decoration: BoxDecoration(color: AppColors.modalBottomSheetColor),
    constraints:
        BoxConstraints(minWidth: 65.2.w, maxWidth: 65.2.w, minHeight: 7.34.h),
    child: Align(
      alignment:
          !items.isOwnMessage ? Alignment.centerLeft : Alignment.centerRight,
      child: Padding(
        padding: !items.isOwnMessage
            ? EdgeInsets.only(
                left: 3.33.w, top: 0.93.h, bottom: 0.93.h, right: 1.32.w)
            : EdgeInsets.only(
                right: 2.22.w, top: 0.93.h, bottom: 0.93.h, left: 3.61.w),
        child: AutoSizeText(
          _message,
          style: TextStyle(
            fontSize: LocalHelper.getFontSize(15),
            color: AppColors.primaryWightColor,
            fontWeight: FontWeight.w700,
            fontFamily: Strings.ARIAL,
          ),
          maxLines: 8,
          textAlign: TextAlign.left,
        ),
      ),
    ),
  );
}

Container messageField(
    BuildContext context, VoidCallback onClickBtn, VoidCallback onClickArrow) {
  final _formKey = GlobalKey<FormState>();
  return Container(
    padding: EdgeInsets.only(bottom: 2.65.h),
    height: 7.81.h,
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.backgroundPrimaryColor
    ),
    child: Form(
      key: _formKey,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          imagePlus(onClickBtn),
          _messageTextField(_formKey, onClickArrow)
        ],
      ),
    ),
  );
}

Container _messageTextField(Key _formKey, VoidCallback onClickArrow) {
  return Container(
    height: 5.31.h,
    width: 81.1.w,
    color: AppColors.modalBottomSheetColor,
    child: Stack(
      children: [
        Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 0.93.h, bottom: 0.625.h, right: 0.78.w),
              child: buildIcon(Strings.ARROW_CIRCLE_UP_ICON, onClickArrow),
            )),
        textField()
      ],
    ),
  );
}

NotificationAvatar userImage(String urlAvatar) {
  return NotificationAvatar(
    imagePath: urlAvatar,
    radius: 18,
  );
}

Padding imagePlus(VoidCallback onClickBtn) {
  return Padding(
    padding: EdgeInsets.only(
      left: 4.16.w,
      top: 0.78.h,
      right: 2.22.w,
    ),
    child: buildIcon(Strings.IMAGE_PLUS_ICON, onClickBtn),
  );
}

InkWell buildIcon(String iconPath, VoidCallback onClickBtn) {
  return InkWell(
    onTap: () {
      onClickBtn();
    },
    child: Container(
      width: 6.66.w,
      height: 3.75.h,
      child: Image.asset(
        iconPath,
        fit: BoxFit.contain,
      ),
    ),
  );
}

TextFormField textField() {
  return TextFormField(
    style: TextStyle(color: AppColors.primaryWightColor),
    validator: (_input) {
      if (_input!.length == 0) {
        return "Aa";
      } else {
        return null;
      }
    },
    onChanged: (_input) {},
    onSaved: (_input) {},
    decoration: InputDecoration(
        border: InputBorder.none,
        hintText: " Aa",
        hintStyle: TextStyle(color: AppColors.allNotificationsTextColor)),
    autocorrect: false,
  );
}

class ConversationPageArguments {
  final String username;
  final String urlAvatar;

  ConversationPageArguments({required this.urlAvatar, required this.username});
}
