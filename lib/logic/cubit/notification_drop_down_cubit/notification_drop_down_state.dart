part of 'notification_drop_down_cubit.dart';

@immutable
abstract class NotificationDropDownState {
  final String filterName;

  NotificationDropDownState({required this.filterName});
}

class AllNotifications extends NotificationDropDownState {
  AllNotifications() : super(filterName: S.current.allNotifications);
}

class FollowingAndFollowers extends NotificationDropDownState {
  FollowingAndFollowers() : super(filterName: S.current.followingFollowers);
}

class NewVideosAndVictories extends NotificationDropDownState {
  NewVideosAndVictories() : super(filterName: S.current.newVideosVictories);
}

class Comments extends NotificationDropDownState {
  Comments() : super(filterName: S.current.comments);
}

class Messages extends NotificationDropDownState {
  Messages() : super(filterName: S.current.messages);
}

class NewChallengeRequests extends NotificationDropDownState {
  NewChallengeRequests() : super(filterName: S.current.newChallengeRequest);
}
