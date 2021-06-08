part of 'forget_password_cubit.dart';

@immutable
abstract class ForgetPasswordState {
  final int stepIndex;
  ForgetPasswordState({required this.stepIndex});
}

class CreateForgetPasswordEnterEmail extends ForgetPasswordState {
  CreateForgetPasswordEnterEmail() : super(stepIndex: 0);
}

class CreateForgetPasswordEnterCode extends ForgetPasswordState {
  CreateForgetPasswordEnterCode() : super(stepIndex: 1);
}

class CreateForgetPasswordEnterNewPassword extends ForgetPasswordState {
  CreateForgetPasswordEnterNewPassword() : super(stepIndex: 2);
}

class CreateForgetPasswordTermsOfUse extends ForgetPasswordState {
  CreateForgetPasswordTermsOfUse() : super(stepIndex: 3);
}
