import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_photo_state.dart';

class AddPhotoCubit extends Cubit<AddPhotoState> {
  AddPhotoCubit() : super(CreateProfileStepAddPhoto());

  int stepIndex = 0;


  changeStep(String photoURL) async {
    if(photoURL.isEmpty){
      emit(CreateProfileStepAddPhoto());
    }
    else if(photoURL.isNotEmpty){
      emit(CreateProfileStepCompleteSignUp());
    }
    emit(state);
  }

  getStep() async {
    return state;
  }

  int getStepIndex() {
    return stepIndex;
  }
}