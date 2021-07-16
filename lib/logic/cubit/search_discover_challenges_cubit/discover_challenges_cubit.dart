import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'discover_challenges_state.dart';

class DiscoverChallengesCubit extends Cubit<DiscoverChallengesState> {
  DiscoverChallengesCubit() : super(DiscoverChallengesInitial());

  interactEWithSearchField(DiscoverChallengesState state) async {
    emit(state);
  }
}
