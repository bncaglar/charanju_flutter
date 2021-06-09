part of 'add_photo_cubit.dart';

@immutable
abstract class AddPhotoState {
  final String photoUrl;
  AddPhotoState({required this.photoUrl});
}

class AddPhotoStateInitial extends AddPhotoState {
  AddPhotoStateInitial() : super(photoUrl: "");
}

class AddPhotoStateDone extends AddPhotoState {
  final String photoUrl;
  AddPhotoStateDone({
    required this.photoUrl,
  }) : super(photoUrl: photoUrl);
}
