import 'package:bloc/bloc.dart';

class SponsorCurrentImageIndexCubit extends Cubit<int> {
  SponsorCurrentImageIndexCubit() : super(0);

  changeIndex(int currentIndex) async {
    emit(currentIndex);
  }

  int getIndex() {
    return state;
  }
}
