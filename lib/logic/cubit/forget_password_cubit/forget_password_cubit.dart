import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordEmailStep());

  int stepIndex = 0;

  changeStep(ForgetPasswordState state) async {
    emit(state);
  }

  getStep() async {
    return state;
  }

  int getStepIndex() {
    return stepIndex;
  }
}
