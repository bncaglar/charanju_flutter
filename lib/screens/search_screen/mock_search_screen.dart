import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/logic/cubit/search_discover_challenges_cubit/discover_challenges_screens_cubit.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen_components/notifications_app_bar.dart';
import 'package:charanju_flutter/screens/search_screen/search_challenges_results/search_challenges_results.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/search_main_screen.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class MockSearchScreen extends StatefulWidget {
  const MockSearchScreen({Key? key}) : super(key: key);

  @override
  _MockSearchScreenState createState() => _MockSearchScreenState();
}

class _MockSearchScreenState extends State<MockSearchScreen> {
  final log = Logger();

  onChanged() {
    log.i("onChanged started");
    context
        .read<DiscoverChallengesScreensCubit>()
        .changeStep(ShowSearchResultPage());
  }

  onClickQrCode() {
    log.i("onClickQrCode started");
  }

  onClickClose() {
    log.i("onClickClose started");
    context
        .read<DiscoverChallengesScreensCubit>()
        .changeStep(DiscoverChallengesScreensInitial());
  }

  onEditingComplete() {
    log.i("onEditingComplete started");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundPrimaryColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.5.h),
          child: searchScreenBuildAppBar(),
        ),
        body: searchScreenBuildBody(),
      ),
    );
  }

  BlocBuilder searchScreenBuildBody() {
    return BlocBuilder<DiscoverChallengesScreensCubit,
        DiscoverChallengesScreensState>(builder: (context, state) {
      if (state is DiscoverChallengesScreensInitial) {
        return SearchMainScreen();
      }
      if (state is ShowSearchResultPage) {
        return SearchChallengesResultBuilder();
      }
      return Container();
    });
  }

  BlocBuilder searchScreenBuildAppBar() {
    return BlocBuilder<DiscoverChallengesScreensCubit,
        DiscoverChallengesScreensState>(builder: (context, state) {
      if (state is DiscoverChallengesScreensInitial) {
        return buildSearchChallengesAppBar();
      }
      if (state is ShowSearchResultPage) {
        return buildSearchChallengesResultsAppBar();
      }
      return Container();
    });
  }

  NotificationsAppBar buildSearchChallengesAppBar() {
    return NotificationsAppBar(
      addSearchField: true,
      addIconOnAppBar: true,
      addUserPhoto: false,
      addUserName: false,
      addFilterMenu: false,
      onClickBtn: onClickQrCode,
      iconURL: Strings.QR_CODE_SCANNING_PNG,
      addBackBtn: false,
      addSearchFieldTitle: S.of(context).searchChallenges,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      searchFieldWidth: 81.38.w,
    );
  }

  NotificationsAppBar buildSearchChallengesResultsAppBar() {
    return NotificationsAppBar(
      addSearchField: true,
      addIconOnAppBar: true,
      addUserPhoto: false,
      addUserName: false,
      addFilterMenu: false,
      onClickBtn: onClickClose,
      iconURL: Strings.CLOSE_ICON_PNG,
      addBackBtn: false,
      addSearchFieldTitle: S.of(context).searchChallenges,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      searchFieldWidth: 81.38.w,
    );
  }
}
