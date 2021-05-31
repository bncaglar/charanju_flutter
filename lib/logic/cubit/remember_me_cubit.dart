import 'package:bloc/bloc.dart';

class RememberMeCubit extends Cubit<bool> {
  RememberMeCubit() : super(false);

  toggleRememberMe(bool rememberMe) async {
    emit(rememberMe);
  }

  bool isRememberMeChecked() {
    return state;
  }
}
