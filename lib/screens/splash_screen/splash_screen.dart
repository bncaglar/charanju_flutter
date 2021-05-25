import 'dart:async';
import 'package:charanju_flutter/logger/simple_log_printer.dart';
import 'package:charanju_flutter/screens/registration_screens/sign_in_screen/signin_screen.dart';
import 'package:charanju_flutter/screens/splash_screen/splash_logo.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final log = getLogger();

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = Duration(seconds: 4);
    return Timer(_duration, navigationPage);
  }

  navigationPage() async {
    log.i("navigationPage started");
    Navigator.pushReplacementNamed(context, SignInScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimaryColor,
      body: SplashLogo(),
    );
  }
}
