import 'package:charanju_flutter/logger/simple_log_printer.dart';
import 'package:charanju_flutter/screens/registration_screens/creating_profile/registration_steps.dart';
import 'package:charanju_flutter/screens/registration_screens/sign_in_screen/signin_screen.dart';
import 'package:charanju_flutter/screens/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final log = getLogger();

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    log.i(
        "settings.name : ${settings.name}  | ScreenArguments: ${settings.arguments} ");

    Widget child;
    switch (settings.name) {
      case SplashScreen.routeName:
        {
          child = SplashScreen();
          break;
        }
      case SignInScreen.routeName:
        {
          child = SignInScreen();
          break;
        }
      case RegistrationSteps.routeName:
        {
          child = RegistrationSteps();
          break;
        }

      default:
        child = Scaffold(
          body: Center(
            child: Text('No Route founded for : ${settings.name}'),
          ),
        );
        break;
    }

    return MaterialPageRoute(
        settings: settings, builder: (_) => applyFixedScaleFactor(child));
  }

  static Widget applyFixedScaleFactor(Widget child) {
    return Builder(builder: (BuildContext context) {
      final MediaQueryData data = MediaQuery.of(context);
      return MediaQuery(
        data: data.copyWith(textScaleFactor: 1),
        child: child,
      );
    });
  }
}
