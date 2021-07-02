part of 'notification_drop_down_cubit.dart';

@immutable
abstract class NotificationDropDownState {}

class NotificationDropDownInitial extends NotificationDropDownState {}

class FollowingAndFollowers extends NotificationDropDownState {}

class NewVideosAndVictories extends NotificationDropDownState {}

class Comments extends NotificationDropDownState {}

class Messages extends NotificationDropDownState {}

class NewChallengeRequests extends NotificationDropDownState {}
