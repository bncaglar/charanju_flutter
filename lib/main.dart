import 'package:charanju_flutter/core/constants/strings.dart';
import 'package:charanju_flutter/logic/cubit/create_profile_cubit/create_profile_cubit.dart';
import 'package:charanju_flutter/logic/cubit/profile_tab_selscted_cubit/profile_tab_selected_cubit.dart';
import 'package:charanju_flutter/logic/cubit/remember_me_cubit.dart';
import 'package:charanju_flutter/routes.dart';
import 'package:charanju_flutter/widgets/constant_scroll_behavior.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';
import 'generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'logic/cubit/add_photo_cubit/add_photo_cubit.dart';
import 'logic/cubit/forget_password_cubit/forget_password_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appConfigurationSetup();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

Future<void> appConfigurationSetup() async {
  if (kReleaseMode) {
    Logger.level = Level.info;
  } else {
    Logger.level = Level.debug;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RememberMeCubit>(
            create: (BuildContext context) => RememberMeCubit()),
        BlocProvider<CreateProfileCubit>(
            create: (BuildContext context) => CreateProfileCubit()),
        BlocProvider<AddPhotoCubit>(
            create: (BuildContext context) => AddPhotoCubit()),
        BlocProvider<ForgetPasswordCubit>(
            create: (BuildContext context) => ForgetPasswordCubit()),
        BlocProvider<ProfileTabSelectedCubit>(
            create: (BuildContext context) => ProfileTabSelectedCubit()),
      ],
      child: CharanjuApp(),
    );
  }
}

class CharanjuApp extends StatefulWidget {
  @override
  _CharanjuAppState createState() => _CharanjuAppState();
}

class _CharanjuAppState extends State<CharanjuApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        // SystemChrome.setPreferredOrientations([
        //   DeviceOrientation.portraitUp,
        //   DeviceOrientation.portraitDown,
        // ]);
        return MaterialApp(
          scrollBehavior: const ConstantScrollBehavior(),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          title: Strings.APP_TITLE,
          locale: kReleaseMode ? _locale : DevicePreview.locale(context),
          onGenerateRoute: Routes.generateRoute,
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          // ignore: missing_return
          localeResolutionCallback: (deviceLocale, supportedLocales) {
            for (var locale in supportedLocales) {
              if (locale.languageCode == deviceLocale!.languageCode &&
                  locale.countryCode == deviceLocale.countryCode) {
                return locale;
              }
            }
          },
        );
      },
    );
  }
}
