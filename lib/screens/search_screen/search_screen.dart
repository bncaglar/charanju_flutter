import 'package:charanju_flutter/screens/search_screen/search_app_bar.dart';
import 'package:charanju_flutter/screens/search_screen/search_body.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundPrimaryColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.5.h),
          child: SearchAppBar(),
        ),
        body: SearchBody(),
      ),
    );
  }
}
