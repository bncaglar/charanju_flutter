import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/helper/modules/notification_module.dart';

class NotificationData {
  static var notifications = <NotificationModule>[
    NotificationModule(
        urlAvatar: Strings.NOTIFICATION_AVATAR_1,
        notificationMessage: S.current.sentYouMessage,
        receivedTime: "35 min",
        notificationFromUserName: "Karenne ",
        challengeName: "",
        isSeen: true),
    NotificationModule(
        urlAvatar: Strings.NOTIFICATION_AVATAR_2,
        notificationMessage: S.current.wantsToChallengeYou,
        receivedTime: "1h",
        notificationFromUserName: "Molivis ",
        challengeName: "#newstyle",
        isSeen: false),
    NotificationModule(
        urlAvatar: Strings.NOTIFICATION_AVATAR_1,
        notificationMessage: S.current.youWonTheLastChallenge,
        receivedTime: "1d",
        notificationFromUserName: "",
        challengeName: "Karenne #newstyle",
        isSeen: false),
    NotificationModule(
        urlAvatar: Strings.NOTIFICATION_AVATAR_3,
        notificationMessage: S.current.youWonTheBetOn,
        receivedTime: "1d",
        notificationFromUserName: "",
        challengeName: "Lennord #dogportrait",
        isSeen: false),
    NotificationModule(
        urlAvatar: Strings.NOTIFICATION_AVATAR_1,
        notificationMessage: S.current.wantsToChallengeYou,
        receivedTime: "1w",
        notificationFromUserName: "Karenne ",
        challengeName: "#newstyle",
        isSeen: false),
    NotificationModule(
        urlAvatar: Strings.NOTIFICATION_AVATAR_3,
        notificationMessage: S.current.isYourOpponent,
        receivedTime: "2w",
        notificationFromUserName: "Lennord  ",
        challengeName: "#newstyle",
        isSeen: false),
  ];
}
