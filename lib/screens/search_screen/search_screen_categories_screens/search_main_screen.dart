import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/categories_screens/art_screen.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/categories_screens/dance_screen.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/categories_screens/fashion_screen.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/categories_screens/sing_screen.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/categories_screens/sport_screen.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/categories_screens/trending_screen.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchMainScreen extends StatefulWidget {
  @override
  _SearchMainScreenState createState() => _SearchMainScreenState();
}

class _SearchMainScreenState extends State<SearchMainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      initialIndex: 0,
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildTabBar(context),
            buildBody(),
          ],
        ),
      ),
    );
  }

  Container buildBody() {
    return Container(
      height: 80.h,
      child: TabBarView(
        children: [
          TrendingScreen(),
          SportScreen(),
          FashionScreen(),
          ArtScreen(),
          DanceScreen(),
          SingScreen()
        ],
      ),
    );
  }

  TabBar buildTabBar(BuildContext context) {
    return TabBar(
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: AppColors.primaryWightColor,
      tabs: [
        Tab(text: S.of(context).trending),
        Tab(text: S.of(context).sport),
        Tab(text: S.of(context).fashion),
        Tab(text: S.of(context).art),
        Tab(text: S.of(context).dance),
        Tab(text: S.of(context).sing),
      ],
    );
  }
}
