import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/logger/simple_log_printer.dart';
import 'package:charanju_flutter/logic/cubit/search_discover_challenges_cubit/discover_challenges_cubit.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_app_bar/notification_app_bar_builder.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchAppBar extends StatefulWidget {
  const SearchAppBar({Key? key}) : super(key: key);

  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  final log = getLogger();

  onClickQrCode() {
    log.i("onClickQrCode started");
  }

  onEditingComplete() {
    log.i("onEditingComplete started");
  }

  onChanged() {
    log.i("onChanged started");
    context
        .read<DiscoverChallengesCubit>()
        .interactEWithSearchField(ShowSearchResultPage());
  }

  onClickClose() {
    log.i("onClickClose started");
    context
        .read<DiscoverChallengesCubit>()
        .interactEWithSearchField(DiscoverChallengesInitial());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverChallengesCubit, DiscoverChallengesState>(
        builder: (context, state) {
      if (state is DiscoverChallengesInitial) {
        return buildSearchChallengesAppBar();
      }
      if (state is ShowSearchResultPage) {
        return buildSearchChallengesResultsAppBar();
      }
      return Container();
    });
  }

  NotificationAppBarBuilder buildSearchChallengesAppBar() {
    return NotificationAppBarBuilder(
      addSearchField: true,
      addIconOnAppBar: true,
      addUserPhoto: false,
      addUserName: false,
      addFilterMenu: false,
      onClickBtn: onClickQrCode,
      iconURL: Strings.IC_QR_CODE_SCANNING_PNG,
      addBackBtn: false,
      addSearchFieldTitle: S.of(context).searchChallenges,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      searchFieldWidth: 81.38.w,
    );
  }

  NotificationAppBarBuilder buildSearchChallengesResultsAppBar() {
    return NotificationAppBarBuilder(
      addSearchField: true,
      addIconOnAppBar: true,
      addUserPhoto: false,
      addUserName: false,
      addFilterMenu: false,
      onClickBtn: onClickClose,
      iconURL: Strings.IC_CLOSE_ICON_PNG,
      addBackBtn: false,
      addSearchFieldTitle: S.of(context).searchChallenges,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      searchFieldWidth: 81.38.w,
    );
  }
}
