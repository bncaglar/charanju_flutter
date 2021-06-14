import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class AppBarHomeScreen extends StatefulWidget {
  @override
  _AppBarHomeScreenState createState() => _AppBarHomeScreenState();
}

// in widget
class _AppBarHomeScreenState extends State<AppBarHomeScreen> {
  final log = Logger();

  onClickAppBarLogo() {
    log.i("onClickAppBarLogo started");
  }

  onClickBalanceScaleLogo() {
    log.i("onClickBalanceScaleLogo started");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildHomePageAppBar(context),
        ],
      ),
    );
  }

  Container buildHomePageAppBar(BuildContext context) {
    return Container(
      height: 5.31.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appBar(),
          appBarBalanceScale(),
        ],
      ),
    );
  }

  Padding appBar() {
    return Padding(
      padding: EdgeInsets.only(top: 0.78.h, bottom: 0.78.h, left: 2.22.w),
      child: InkWell(
          onTap: () {
            onClickAppBarLogo();
          },
          child: appBarLogo()),
    );
  }

  Padding appBarBalanceScale() {
    return Padding(
      padding: EdgeInsets.only(top: 0.78.h, bottom: 0.78.h, right: 2.50.w),
      child: InkWell(
        onTap: () {
          onClickBalanceScaleLogo();
        },
        child: appBarBalanceScaleLogo(),
      ),
    );
  }

  Container appBarLogo() {
    return Container(
        height: 3.75.h,
        width: 6.66.w,
        child: Image.asset(
          Strings.APP_BAR_HOME_SCREEN_LOGO_PNG,
          fit: BoxFit.fill,
        ));
  }

  Container appBarBalanceScaleLogo() {
    return Container(
        height: 3.75.h,
        width: 6.66.w,
        child: Image.asset(
          Strings.APP_BAR_HOME_SCREEN_BALANCE_SCALE_PNG,
          fit: BoxFit.fill,
        ));
  }
}
