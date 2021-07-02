class NotificationModule {
  final String urlAvatar;
  final String notificationMessage;
  final String receivedTime;
  final String notificationFromUserName;
  final String challengeName;
  final bool isSeen;
  final String lastMessage;
  final String username;
  final String groupMembers;
  final String groupTitle;
  final String categories;

  const NotificationModule(
      {required this.urlAvatar,
      required this.notificationMessage,
      required this.receivedTime,
      required this.notificationFromUserName,
      required this.challengeName,
      required this.isSeen,
      required this.lastMessage,
      required this.username,
      required this.groupMembers,
      required this.groupTitle,
      required this.categories});
}
