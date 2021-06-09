part of 'forget_password_cubit.dart';

@immutable
abstract class ForgetPasswordState {
  final int stepIndex;
  ForgetPasswordState({required this.stepIndex});
}

class ForgetPasswordEmailStep extends ForgetPasswordState {
  ForgetPasswordEmailStep() : super(stepIndex: 0);
}

class ForgetPasswordCodeStep extends ForgetPasswordState {
  ForgetPasswordCodeStep() : super(stepIndex: 1);
}

class ForgetPasswordNewPasswordStep extends ForgetPasswordState {
  ForgetPasswordNewPasswordStep() : super(stepIndex: 2);
}
