import 'package:charanju_flutter/helper/modules/notification_module.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';

class NotificationAvatar extends StatefulWidget {
  final String imagePath;
  final Widget? notificationEllipse;
  final double? radius;

  NotificationAvatar(
      {required this.imagePath, this.notificationEllipse, this.radius});

  @override
  _NotificationAvatarState createState() => _NotificationAvatarState();
}

class _NotificationAvatarState extends State<NotificationAvatar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primaryWightColor,
            ),
          ),
          child: CircleAvatar(
            ///todo photoURL will come from API
            radius: widget.radius ?? 30,
            backgroundImage: AssetImage(
              widget.imagePath,
            ),
            backgroundColor: Colors.transparent,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: widget.notificationEllipse ?? Container(),
        )
      ],
    );
  }
}
