import 'package:bloc/bloc.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:meta/meta.dart';

part 'notification_drop_down_state.dart';

class NotificationDropDownCubit extends Cubit<NotificationDropDownState> {
  NotificationDropDownCubit() : super(AllNotifications());

  changeFilterOption(NotificationDropDownState state) async {
    emit(state);
  }
}
