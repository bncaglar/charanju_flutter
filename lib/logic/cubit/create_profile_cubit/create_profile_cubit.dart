import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_profile_state.dart';

class CreateProfileCubit extends Cubit<CreateProfileState> {
  CreateProfileCubit() : super(CreateProfileStepEnterEmail());

  int stepIndex = 0;

  changeStep(CreateProfileState state) async {
    emit(state);
  }

  getStep() async {
    return state;
  }

  int getStepIndex() {
    return stepIndex;
  }
}
