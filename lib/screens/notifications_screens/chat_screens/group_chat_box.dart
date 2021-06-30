import 'package:charanju_flutter/helper/modules/notification_module.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/avatar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GroupChatBox extends StatelessWidget {
  final NotificationModule item;

  const GroupChatBox({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 17.w,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 2.31.h,
            child: NotificationAvatar(
              imagePath: item.urlAvatar,
              radius: 25,
            ),
          ),
          Positioned(
            top: 3.50.h,
            left: 4.95.w,
            child: NotificationAvatar(
              imagePath: item.groupMembers,
              radius: 25,
            ),
          ),
        ],
      ),
    );
  }
}
