import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_photo_state.dart';

class AddPhotoCubit extends Cubit<AddPhotoState> {
  AddPhotoCubit() : super(AddPhotoStateInitial());

  addNewPhoto({required String photoURL}) async {
    if (photoURL.isEmpty) {
      emit(AddPhotoStateInitial());
    } else {
      emit(AddPhotoStateDone(photoUrl: photoURL));
    }
  }

  String getPhotoUrl() {
    return state.photoUrl;
  }

  getAddPhotoState() {
    return state;
  }
}
