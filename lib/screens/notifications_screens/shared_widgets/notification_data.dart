import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/screens/notifications_screens/shared_widgets/notification_helper.dart';

class NotificationData {
  static var notifications = <NotificationHelper>[
    NotificationHelper(
        urlAvatar: Strings.NOTIFICATION_AVATAR_1,
        title: "sent you a message",
        timer: "35 min",
        name: "Karenne ",
        challengeName: "",
        isSeen: true),
    NotificationHelper(
        urlAvatar: Strings.NOTIFICATION_AVATAR_2,
        title: "wants to challenge you to ",
        timer: "1h",
        name: "Molivis ",
        challengeName: "#newstyle",
        isSeen: false),
    NotificationHelper(
        urlAvatar: Strings.NOTIFICATION_AVATAR_1,
        title: "the last challenge against ",
        timer: "1d",
        name: "You won ",
        challengeName: "Karenne #newstyle",
        isSeen: false),
    NotificationHelper(
        urlAvatar: Strings.NOTIFICATION_AVATAR_3,
        title: "the bet on ",
        timer: "1d",
        name: "You won ",
        challengeName: "Lennord #dogportrait",
        isSeen: false),
    NotificationHelper(
        urlAvatar: Strings.NOTIFICATION_AVATAR_1,
        title: "wants to challenge you to ",
        timer: "1w",
        name: "Karenne ",
        challengeName: "#newstyle",
        isSeen: false),
    NotificationHelper(
        urlAvatar: Strings.NOTIFICATION_AVATAR_3,
        title: "is your opponent in ",
        timer: "2w",
        name: "Lennord  ",
        challengeName: "#newstyle",
        isSeen: false),
  ];
}
