import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/helper/local_data/local_helper.dart';
import 'package:charanju_flutter/logic/cubit/naviigation_system_cubit/navigation_system_cubit.dart';
import 'package:charanju_flutter/screens/bottom_navigation_bar/navigation_bottom_sheet.dart';
import 'package:charanju_flutter/screens/home_screens/home_screen.dart';
import 'package:charanju_flutter/screens/my_profile_screens/my_profile_screen.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen.dart';
import 'package:charanju_flutter/widgets/icon_btn_as_image.dart';
import 'package:charanju_flutter/widgets/linear_gradient_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  static const routeName = '/BottomNavigationBarScreen';

  @override
  _BottomNavigationBarScreenState createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  final log = Logger();

  selectTheScreen({
    required NavigationSystemState navigationSystemState,
    bool? showBottomSheet = false,
  }) {
    log.i("selectTheScreen Started");
    context
        .read<NavigationSystemCubit>()
        .changeScreen(navigationSystemState: navigationSystemState);

    if (showBottomSheet!) {
      LocalHelper.showTheBottomSheet(
        context: context,
        child: NavigationBottomSheet(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            buildScreens(),
            buildBarGradientShadow(),
            buildBottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  Align buildBottomNavigationBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.only(
          right: 5.w,
          left: 5.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildHomeBtn(),
            buildSearchBtn(),
            buildBottomSheetBtn(),
            buildNotificationBtn(),
            buildProfileBtn(),
          ],
        ),
      ),
    );
  }

  IconBtnAsPngImage buildProfileBtn() {
    return IconBtnAsPngImage(
      imageUrl: Strings.IC_NAVIGATION_USER_PNG,
      onClickBtn: () {
        selectTheScreen(
          navigationSystemState: ProfileScreenState(),
        );
      },
    );
  }

  IconBtnAsPngImage buildNotificationBtn() {
    return IconBtnAsPngImage(
      imageUrl: Strings.IC_NAVIGATION_NOTIFICATIONS_PNG,
      onClickBtn: () {
        selectTheScreen(
          navigationSystemState: NotificationsScreenState(),
        );
      },
    );
  }

  BlocBuilder<NavigationSystemCubit, NavigationSystemState>
      buildBottomSheetBtn() {
    return BlocBuilder<NavigationSystemCubit, NavigationSystemState>(
      builder: (context, state) {
        return IconBtnAsPngImage(
          imageUrl: Strings.IC_NAVIGATION_CIRCLE_PNG,
          onClickBtn: () {
            selectTheScreen(
              navigationSystemState:
                  context.read<NavigationSystemCubit>().getTheCurrentScreen(),
              showBottomSheet: true,
            );
          },
        );
      },
    );
  }

  IconBtnAsPngImage buildSearchBtn() {
    return IconBtnAsPngImage(
      imageUrl: Strings.IC_NAVIGATION_SEARCH_PNG,
      onClickBtn: () {
        selectTheScreen(
          navigationSystemState: SearchScreenState(),
        );
      },
    );
  }

  IconBtnAsPngImage buildHomeBtn() {
    return IconBtnAsPngImage(
      imageUrl: Strings.IC_NAVIGATION_HOME_PNG,
      onClickBtn: () {
        selectTheScreen(
          navigationSystemState: HomeScreenState(),
        );
      },
    );
  }

  BlocBuilder<NavigationSystemCubit, NavigationSystemState>
      buildBarGradientShadow() {
    return BlocBuilder<NavigationSystemCubit, NavigationSystemState>(
      builder: (context, navigationSystemState) {
        if (navigationSystemState is ProfileScreenState) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: LinearGradientShadow(
              height: 7.h,
              topOpacity: 1,
              bottomOpacity: 1,
            ),
          );
        }
        return Align(
          alignment: Alignment.bottomCenter,
          child: LinearGradientShadow(
            height: 10.h,
            topOpacity: 0,
            bottomOpacity: 0.6,
          ),
        );
      },
    );
  }

  BlocBuilder<NavigationSystemCubit, NavigationSystemState> buildScreens() {
    return BlocBuilder<NavigationSystemCubit, NavigationSystemState>(
      builder: (context, navigationSystemState) {
        if (navigationSystemState is HomeScreenState) {
          return HomeScreen();
        }
        if (navigationSystemState is SearchScreenState) {
          return SearchScreen();
        }
        if (navigationSystemState is NotificationsScreenState) {
          return NotificationScreen();
        }
        if (navigationSystemState is ProfileScreenState) {
          return MyProfileScreen();
        }
        return Container();
      },
    );
  }
}
