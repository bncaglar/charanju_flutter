part of 'create_profile_cubit.dart';

@immutable
abstract class CreateProfileState {
  final int stepIndex;
  CreateProfileState({required this.stepIndex});
}

class CreateProfileStepEnterEmail extends CreateProfileState {
  CreateProfileStepEnterEmail() : super(stepIndex: 0);
}

class CreateProfileStepEnterPassword extends CreateProfileState {
  CreateProfileStepEnterPassword() : super(stepIndex: 1);
}

class CreateProfileStepEnterUserName extends CreateProfileState {
  CreateProfileStepEnterUserName() : super(stepIndex: 2);
}

class CreateProfileStepEnterBirthday extends CreateProfileState {
  CreateProfileStepEnterBirthday() : super(stepIndex: 3);
}
