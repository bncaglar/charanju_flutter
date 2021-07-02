import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'notification_drop_down_state.dart';

class NotificationDropDownCubit extends Cubit<NotificationDropDownState> {
  NotificationDropDownCubit() : super(NotificationDropDownInitial());

  changeStep(NotificationDropDownState state) async {
    emit(state);
  }

}
