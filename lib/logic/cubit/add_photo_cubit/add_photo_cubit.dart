import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_photo_state.dart';

class AddPhotoCubit extends Cubit<AddPhotoState> {
  AddPhotoCubit() : super(CreateProfileStepAddPhoto());

  int stepIndex = 0;

  changeStep(AddPhotoState state) async {
    emit(state);
  }

  getStep() async {
    return state;
  }

  int getStepIndex() {
    return stepIndex;
  }
}