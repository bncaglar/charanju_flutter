import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'discover_challenges_screens_state.dart';

class DiscoverChallengesScreensCubit extends Cubit<DiscoverChallengesScreensState> {
  DiscoverChallengesScreensCubit() : super(DiscoverChallengesScreensInitial());

  changeStep(DiscoverChallengesScreensState state) async {
    emit(state);
  }
}
