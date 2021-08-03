import 'package:charanju_flutter/logic/cubit/search_discover_challenges_cubit/discover_challenges_cubit.dart';
import 'package:charanju_flutter/screens/search_screen/search_challenges_results_screen/search_challenges_results_screen.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/search_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverChallengesCubit, DiscoverChallengesState>(
        builder: (context, state) {
      if (state is DiscoverChallengesInitial) {
        return SearchMainScreen();
      }
      if (state is ShowSearchResultPage) {
        return SearchChallengesResultScreenBuilder();
      }
      return Container();
    });
  }
}
