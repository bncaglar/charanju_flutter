import 'package:charanju_flutter/logger/simple_log_printer.dart';
import 'package:charanju_flutter/screens/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:charanju_flutter/screens/home_screens/home_screen.dart';
import 'package:charanju_flutter/screens/my_profile_screens/my_profile_screen.dart';
import 'package:charanju_flutter/screens/notifications_screens/chat_screens/chat_screen.dart';
import 'package:charanju_flutter/screens/notifications_screens/profile_of_another_user_screen/profile_of_another_user_screen.dart';
import 'package:charanju_flutter/screens/notifications_screens/messages_screen.dart';
import 'package:charanju_flutter/screens/notifications_screens/notification_screen.dart';
import 'package:charanju_flutter/screens/notifications_screens/search_user_screen/search_user_screen.dart';
import 'package:charanju_flutter/screens/registration_screens/creating_profile/registration_steps.dart';
import 'package:charanju_flutter/screens/registration_screens/forget_password/forget_password_screen.dart';
import 'package:charanju_flutter/screens/registration_screens/sign_in_screen/signin_screen.dart';
import 'package:charanju_flutter/screens/registration_screens/terms_of_use/terms_of_use_screen.dart';
import 'package:charanju_flutter/screens/search_screen/challengeSplitImages.dart';
import 'package:charanju_flutter/screens/search_screen/selected_challenge_hashtag.dart';
import 'package:charanju_flutter/screens/settings_screen/settings_screen.dart';
import 'package:charanju_flutter/screens/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/notifications_screens/chat_screens/chat_screen.dart';

final log = getLogger();

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    log.i(
        "settings.name : ${settings.name}  | ScreenArguments: ${settings
            .arguments} ");

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
      case ForgetPasswordScreen.routeName:
        {
          child = ForgetPasswordScreen();
          break;
        }
      case MyProfileScreen.routeName:
        {
          child = MyProfileScreen();
          break;
        }
      case SettingsScreen.routeName:
        {
          child = SettingsScreen();
          break;
        }
      case TermsOfUseScreen.routeName:
        {
          child = TermsOfUseScreen();
          break;
        }
      case BottomNavigationBarScreen.routeName:
        {
          child = BottomNavigationBarScreen();
          break;
        }
      case HomeScreen.routeName:
        {
          child = HomeScreen();
          break;
        }
      case NotificationScreen.routeName:
        {
          child = NotificationScreen();

          break;
        }
      case MessagesScreen.routeName:
        {
          child = MessagesScreen();
          break;
        }

      case ChatScreen.routeName:
        {
          child =
              _buildChatScreenRoute(settings.arguments as ChatScreenArguments);
          break;
        }
      case ProfileOfAnotherUserScreen.routeName:
        {
          child = _buildProfileOfAnotherUserRoute(
              settings.arguments as ProfileOfAnotherUserScreenArguments);
          break;
        }
      case SearchUserScreen.routeName:
        {
          child = SearchUserScreen();
          break;
        }
      case SelectedChallengeHashTagPage.routeName:
        {
          child = _buildSelectedChallengeRoute(
              settings.arguments as SelectedChallengeArguments);
          break;
        }

      case ChallengeSplitImages.routeName:
        {
          child = _buildChallengeSplitImagesRoute(
            settings.arguments as ChallengeSplitImagesArguments
          );
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

  static Widget _buildChatScreenRoute(ChatScreenArguments arguments) {
    String urlAvatar = arguments.urlAvatar;
    String username = arguments.username;
    return ChatScreen(
      username: username,
      urlAvatar: urlAvatar,
    );
  }

  static Widget _buildProfileOfAnotherUserRoute(
      ProfileOfAnotherUserScreenArguments arguments) {
    String urlAvatar = arguments.urlAvatar;
    String username = arguments.username;
    return ProfileOfAnotherUserScreen(
      username: username,
      urlAvatar: urlAvatar,
    );
  }

  static Widget _buildSelectedChallengeRoute(
      SelectedChallengeArguments arguments) {
    String challengeName = arguments.challengeName;
    String challengeDescription = arguments.challengeDescription;
    String challengePhotoRight = arguments.challengePhotoRight;
    String challengePhotoLeft = arguments.challengePhotoLeft;
    return SelectedChallengeHashTagPage(
      challengeName: challengeName,
      challengeDescription: challengeDescription,
      challengePhotoRight: challengePhotoRight,
      challengePhotoLeft: challengePhotoLeft,
    );
  }

  static Widget _buildChallengeSplitImagesRoute(
      ChallengeSplitImagesArguments arguments) {
    String? challengeName = arguments.challengeName;
    String? leftPhoto = arguments.leftPhoto;
    String? rightPhoto = arguments.rightPhoto;
    return ChallengeSplitImages(
        challengeName: challengeName,
        rightPhoto: rightPhoto,
        leftPhoto: leftPhoto);
  }
}
