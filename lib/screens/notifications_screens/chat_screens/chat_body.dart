import 'dart:async';
import 'package:charanju_flutter/helper/dummy_data/chat_data.dart';
import 'package:charanju_flutter/helper/modules/chat_module.dart';
import 'package:charanju_flutter/screens/notifications_screens/chat_screens/chat_message_field_form.dart';
import 'package:charanju_flutter/screens/notifications_screens/chat_screens/chat_messages_item.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class ChatBody extends StatefulWidget {
  final String? urlAvatar;
  final String? username;

  const ChatBody({Key? key, this.username, this.urlAvatar}) : super(key: key);

  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  final ScrollController listViewController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext _context) {
        return Stack(
          children: <Widget>[
            buildChatMessages(
                ChatData.items, widget.urlAvatar!, listViewController),
            ChatMessageFieldForm(),
          ],
        );
      },
    );
  }

  Widget buildChatMessages(List<ChatModule> items, String urlAvatar,
      ScrollController listViewController) {
    Timer(
      Duration(milliseconds: 50),
      () => {
        listViewController.jumpTo(listViewController.position.maxScrollExtent),
      },
    );
    return Container(
      padding: EdgeInsets.only(bottom: 7.81.h),
      decoration: BoxDecoration(color: AppColors.backgroundPrimaryColor),
      child: ListView.builder(
        controller: listViewController,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return ChatMessagesItem(item: item, urlAvatar: urlAvatar);
        },
      ),
    );
  }
}
