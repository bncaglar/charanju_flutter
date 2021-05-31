// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `hello`
  String get hello {
    return Intl.message(
      'hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `ready, set, challenge`
  String get readySetChallenge {
    return Intl.message(
      'ready, set, challenge',
      name: 'readySetChallenge',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email Address`
  String get invalidEmailAddress {
    return Intl.message(
      'Invalid Email Address',
      name: 'invalidEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get required {
    return Intl.message(
      'Required',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `Password must have a minimum length of 8`
  String get passwordMinimumLength {
    return Intl.message(
      'Password must have a minimum length of 8',
      name: 'passwordMinimumLength',
      desc: '',
      args: [],
    );
  }

  /// `Password must have one uppercase letter`
  String get passwordOneUppercase {
    return Intl.message(
      'Password must have one uppercase letter',
      name: 'passwordOneUppercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must have one number`
  String get passwordOneNumber {
    return Intl.message(
      'Password must have one number',
      name: 'passwordOneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password must have one special character`
  String get passwordOneSpecialCharacter {
    return Intl.message(
      'Password must have one special character',
      name: 'passwordOneSpecialCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation does not match`
  String get confirmationDoesNotMatch {
    return Intl.message(
      'Confirmation does not match',
      name: 'confirmationDoesNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get rememberMe {
    return Intl.message(
      'Remember Me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Do not have an account? `
  String get doYouHaveAccount {
    return Intl.message(
      'Do not have an account? ',
      name: 'doYouHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Create your profile`
  String get createYourProfile {
    return Intl.message(
      'Create your profile',
      name: 'createYourProfile',
      desc: '',
      args: [],
    );
  }

  /// `We’ll use this to sign you in or create an account if you don’t have one yet`
  String get weWillUseThisToSignYou {
    return Intl.message(
      'We’ll use this to sign you in or create an account if you don’t have one yet',
      name: 'weWillUseThisToSignYou',
      desc: '',
      args: [],
    );
  }

  /// `continue`
  String get continueText {
    return Intl.message(
      'continue',
      name: 'continueText',
      desc: '',
      args: [],
    );
  }

  /// `sign in`
  String get signIn {
    return Intl.message(
      'sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get userName {
    return Intl.message(
      'Username',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Choose a password so we can create an account for you. It must consist of at least 8 characters`
  String get choosePassword {
    return Intl.message(
      'Choose a password so we can create an account for you. It must consist of at least 8 characters',
      name: 'choosePassword',
      desc: '',
      args: [],
    );
  }

  /// `User name should start with capital letter`
  String get userNameStartWithCapitalLetter {
    return Intl.message(
      'User name should start with capital letter',
      name: 'userNameStartWithCapitalLetter',
      desc: '',
      args: [],
    );
  }

  /// `Come up with your nickname so people can easily find you `
  String get textUnderUserNameField {
    return Intl.message(
      'Come up with your nickname so people can easily find you ',
      name: 'textUnderUserNameField',
      desc: '',
      args: [],
    );
  }

  /// `Birthday`
  String get birthday {
    return Intl.message(
      'Birthday',
      name: 'birthday',
      desc: '',
      args: [],
    );
  }

  /// `This information won’t be shown publicly.`
  String get textUnderBirthdayField {
    return Intl.message(
      'This information won’t be shown publicly.',
      name: 'textUnderBirthdayField',
      desc: '',
      args: [],
    );
  }

  /// `Wrong date format use this format 'dd/mm/yyyy'`
  String get wrongFormat {
    return Intl.message(
      'Wrong date format use this format \'dd/mm/yyyy\'',
      name: 'wrongFormat',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'da'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'pl'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'sv'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
