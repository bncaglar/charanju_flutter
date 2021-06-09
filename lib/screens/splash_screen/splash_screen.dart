import 'dart:async';
import 'package:charanju_flutter/logger/simple_log_printer.dart';
import 'package:charanju_flutter/screens/registration_screens/sign_in_screen/signin_screen.dart';
import 'package:charanju_flutter/utilities/colors.dart';
import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final log = getLogger();

  Artboard? _riveArtBoard;
  RiveAnimationController? _controller;

  bool get isPlaying => _controller?.isActive ?? false;

  loadAnimationFile() {
    rootBundle.load(Strings.LOGO_ICON_RIV).then(
      (data) async {
        final RiveFile file = RiveFile.import(data);
        final Artboard artBoard = file.mainArtboard;
        artBoard.addController(_controller = SimpleAnimation(
          'Animation 1',
          mix: 0.3,
        ));

        setState(() => _riveArtBoard = artBoard);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    loadAnimationFile();
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
      body: Center(
        child: _riveArtBoard == null
            ? const SizedBox()
            : Container(
                width: 50.w,
                child: Rive(
                  artboard: _riveArtBoard!,
                  useArtboardSize: true,
                ),
              ),
      ),
    );
  }
}
