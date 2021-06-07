part of 'add_photo_cubit.dart';

@immutable
abstract class AddPhotoState {
  final int stepIndex;
  AddPhotoState({required this.stepIndex});
}

class CreateProfileStepAddPhoto extends AddPhotoState{
  CreateProfileStepAddPhoto() : super(stepIndex: 0);
}


