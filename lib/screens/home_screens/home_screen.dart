import 'package:charanju_flutter/screens/home_screens/home_body_list.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/screens/home_screens/home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundPrimaryColor,
        body: SizedBox(
          width: double.infinity,
          child: CustomScrollView(
            slivers: <Widget>[
              HomeAppBar(),
              HomeBodyList(),
            ],
          ),
        ),
      ),
    );
  }
}
