import 'package:charanju_flutter/generated/l10n.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/categories/Fashion.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/categories/art.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/categories/dance.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/categories/sing.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/categories/sport.dart';
import 'package:charanju_flutter/screens/search_screen/search_screen_categories_screens/categories/trendings.dart';
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundPrimaryColor,
      body: DefaultTabController(
        length: 6,
        initialIndex: 0,
        child: Column(
          children: [
            TabBar(
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
            ),
            Container(
              height: 80.h,
              child: TabBarView(
                children: [
                  TrendingPage(),
                  SportPage(),
                  FashionPage(),
                  ArtPage(),
                  DancePage(),
                  SingPage()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
