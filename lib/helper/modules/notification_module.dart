class NotificationModule {
  final String urlAvatar;
  final String notificationMessage;
  final String receivedTime;
  final String notificationFromUserName;
  final String challengeName;
  final bool isSeen;

  const NotificationModule(
      {required this.urlAvatar,
      required this.notificationMessage,
      required this.receivedTime,
      required this.notificationFromUserName,
      required this.challengeName,
      required this.isSeen});
}
