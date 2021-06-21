import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_tab_selected_state.dart';

class ProfileTabSelectedCubit extends Cubit<ProfileTabSelectedState> {
  ProfileTabSelectedCubit() : super(ProfileTabSelected());

  changeProfileTab({required ProfileTabSelectedState profileTabSelectedState}) {
    emit(profileTabSelectedState);
  }

  ProfileTabSelectedState getProfileTab() {
    return state;
  }
}
