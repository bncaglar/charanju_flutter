import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/screens/bottom_navigation_bar/example_pages/page1.dart';
import 'package:charanju_flutter/screens/bottom_navigation_bar/example_pages/page2.dart';
import 'package:charanju_flutter/screens/bottom_navigation_bar/example_pages/page3.dart';
import 'package:charanju_flutter/screens/bottom_navigation_bar/example_pages/page4.dart';
import 'package:charanju_flutter/screens/bottom_navigation_bar/example_pages/page5.dart';
import 'package:charanju_flutter/screens/bottom_navigation_bar/shared_widget/create_icon.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  static const routeName = '/BottomNavigationBarScreen';

  @override
  _BottomNavigationBarScreenState createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _selectedIndex = 0;
  final tabs = [Page1(), Page2(), Page3(), Page4(), Page5()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: tabs[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black.withOpacity(0),
          elevation: 0,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            navigationItem(Strings.NAVIGATION_HOME_PNG),
            navigationItem(Strings.NAVIGATION_SEARCH_PNG),
            navigationItem(Strings.NAVIGATION_CIRCLE_PNG),
            navigationItem(Strings.NAVIGATION_NOTIFICATIONS_PNG),
            navigationItem(Strings.NAVIGATION_USER_PNG),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ));
  }

  BottomNavigationBarItem navigationItem(String iconPath) {
    return BottomNavigationBarItem(
        icon: CreateIcon(
          iconPath: iconPath,
        ),
        label: "",
        backgroundColor: Colors.transparent);
  }

}
