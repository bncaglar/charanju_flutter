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

  /// `Continue`
  String get continueText {
    return Intl.message(
      'Continue',
      name: 'continueText',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
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

  /// `Import from facebook`
  String get importFromFacebook {
    return Intl.message(
      'Import from facebook',
      name: 'importFromFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Import from Instagram`
  String get importFromInstagram {
    return Intl.message(
      'Import from Instagram',
      name: 'importFromInstagram',
      desc: '',
      args: [],
    );
  }

  /// `Take photo`
  String get takePhoto {
    return Intl.message(
      'Take photo',
      name: 'takePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Choose from gallery`
  String get chooseFromGallery {
    return Intl.message(
      'Choose from gallery',
      name: 'chooseFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Add a photo`
  String get addPhotoText {
    return Intl.message(
      'Add a photo',
      name: 'addPhotoText',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Add a profile picture for recognition`
  String get addaProfilePhotoRecognition {
    return Intl.message(
      'Add a profile picture for recognition',
      name: 'addaProfilePhotoRecognition',
      desc: '',
      args: [],
    );
  }

  /// `Add profile photo`
  String get addProfilePhoto {
    return Intl.message(
      'Add profile photo',
      name: 'addProfilePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Complete sign up`
  String get completeSignUp {
    return Intl.message(
      'Complete sign up',
      name: 'completeSignUp',
      desc: '',
      args: [],
    );
  }

  /// `By registering, you agree to our `
  String get addCompleteSignUpTermsTextPart1 {
    return Intl.message(
      'By registering, you agree to our ',
      name: 'addCompleteSignUpTermsTextPart1',
      desc: '',
      args: [],
    );
  }

  /// `terms of use, our data policy and our policy for cookies.`
  String get addCompleteSignUpTermsTextPart2 {
    return Intl.message(
      'terms of use, our data policy and our policy for cookies.',
      name: 'addCompleteSignUpTermsTextPart2',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgotPasswordText {
    return Intl.message(
      'Forgot password',
      name: 'forgotPasswordText',
      desc: '',
      args: [],
    );
  }

  /// `We’ll send a code to your account. You can use that to change and create a new password.`
  String get weWillSendCode {
    return Intl.message(
      'We’ll send a code to your account. You can use that to change and create a new password.',
      name: 'weWillSendCode',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get code {
    return Intl.message(
      'Code',
      name: 'code',
      desc: '',
      args: [],
    );
  }

  /// `If you didn’t receive a code.`
  String get receiveCode {
    return Intl.message(
      'If you didn’t receive a code.',
      name: 'receiveCode',
      desc: '',
      args: [],
    );
  }

  /// ` Resend code.`
  String get resendCodeText {
    return Intl.message(
      ' Resend code.',
      name: 'resendCodeText',
      desc: '',
      args: [],
    );
  }

  /// `Invalid code`
  String get invalidCode {
    return Intl.message(
      'Invalid code',
      name: 'invalidCode',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password must consist of at least 8 characters.`
  String get passwordMustContain {
    return Intl.message(
      'Password must consist of at least 8 characters.',
      name: 'passwordMustContain',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Use`
  String get termsOfUse {
    return Intl.message(
      'Terms of Use',
      name: 'termsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet, consectetur adipiscing elit. Felis nulla metus turpis ut et cursus amet fringilla. Gravida pellentesque ac volutpat ultrices orci. Massa aliquam consectetur id in feugiat velit et eget. Eget at ultricies lectus lobortis neque, amet imperdiet. Pretium libero, nisi, ut porttitor fringilla morbi purus eu rhoncus. Amet etiam quis consequat magna sed aliquet mattis dapibus tellus. Velit mauris dui eu nibh arcu tellus sapien sollicitudin. Auctor turpis odio in mus donec aliquet nam elementum sed.`
  String get termsOfUseLongText {
    return Intl.message(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Felis nulla metus turpis ut et cursus amet fringilla. Gravida pellentesque ac volutpat ultrices orci. Massa aliquam consectetur id in feugiat velit et eget. Eget at ultricies lectus lobortis neque, amet imperdiet. Pretium libero, nisi, ut porttitor fringilla morbi purus eu rhoncus. Amet etiam quis consequat magna sed aliquet mattis dapibus tellus. Velit mauris dui eu nibh arcu tellus sapien sollicitudin. Auctor turpis odio in mus donec aliquet nam elementum sed.',
      name: 'termsOfUseLongText',
      desc: '',
      args: [],
    );
  }

  /// `Agree`
  String get agree {
    return Intl.message(
      'Agree',
      name: 'agree',
      desc: '',
      args: [],
    );
  }

  /// `•   Amet etiam quis consequat magna sed aliquet mattis dapibus tellus.`
  String get paragraph1 {
    return Intl.message(
      '•   Amet etiam quis consequat magna sed aliquet mattis dapibus tellus.',
      name: 'paragraph1',
      desc: '',
      args: [],
    );
  }

  /// `•   Velit mauris dui eu nibh arcu tellus sapien sollicitudin.`
  String get paragraph2 {
    return Intl.message(
      '•   Velit mauris dui eu nibh arcu tellus sapien sollicitudin.',
      name: 'paragraph2',
      desc: '',
      args: [],
    );
  }

  /// `•   Auctor turpis odio in mus donec aliquet nam elementum sed.`
  String get paragraph3 {
    return Intl.message(
      '•   Auctor turpis odio in mus donec aliquet nam elementum sed.',
      name: 'paragraph3',
      desc: '',
      args: [],
    );
  }

  /// `Terms`
  String get terms {
    return Intl.message(
      'Terms',
      name: 'terms',
      desc: '',
      args: [],
    );
  }

  /// `Follows`
  String get follows {
    return Intl.message(
      'Follows',
      name: 'follows',
      desc: '',
      args: [],
    );
  }

  /// `Followers`
  String get followers {
    return Intl.message(
      'Followers',
      name: 'followers',
      desc: '',
      args: [],
    );
  }

  /// `Points`
  String get points {
    return Intl.message(
      'Points',
      name: 'points',
      desc: '',
      args: [],
    );
  }

  /// `Biography`
  String get biography {
    return Intl.message(
      'Biography',
      name: 'biography',
      desc: '',
      args: [],
    );
  }

  /// `Volutpat maecenas volutpat blandit aliquam etiam erat velit. Suspendisse interdum consectetur libero id faucibus nisl tincidunt. Hendrerit gravida rutrum quisque non tellus orci ac auctor.`
  String get biographyLongText {
    return Intl.message(
      'Volutpat maecenas volutpat blandit aliquam etiam erat velit. Suspendisse interdum consectetur libero id faucibus nisl tincidunt. Hendrerit gravida rutrum quisque non tellus orci ac auctor.',
      name: 'biographyLongText',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `General Settings`
  String get generalSettings {
    return Intl.message(
      'General Settings',
      name: 'generalSettings',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `On`
  String get on {
    return Intl.message(
      'On',
      name: 'on',
      desc: '',
      args: [],
    );
  }

  /// `Backup Files`
  String get backupFiles {
    return Intl.message(
      'Backup Files',
      name: 'backupFiles',
      desc: '',
      args: [],
    );
  }

  /// `Content Settings`
  String get contentSettings {
    return Intl.message(
      'Content Settings',
      name: 'contentSettings',
      desc: '',
      args: [],
    );
  }

  /// `Video Language`
  String get videoLanguage {
    return Intl.message(
      'Video Language',
      name: 'videoLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Interest Settings`
  String get interestSettings {
    return Intl.message(
      'Interest Settings',
      name: 'interestSettings',
      desc: '',
      args: [],
    );
  }

  /// `Animated Miniature`
  String get animatedMiniature {
    return Intl.message(
      'Animated Miniature',
      name: 'animatedMiniature',
      desc: '',
      args: [],
    );
  }

  /// `Remove photosensitive videos`
  String get removePhotosensitiveVideos {
    return Intl.message(
      'Remove photosensitive videos',
      name: 'removePhotosensitiveVideos',
      desc: '',
      args: [],
    );
  }

  /// `Data settings`
  String get dataSettings {
    return Intl.message(
      'Data settings',
      name: 'dataSettings',
      desc: '',
      args: [],
    );
  }

  /// `Mobile data use`
  String get mobileDataUse {
    return Intl.message(
      'Mobile data use',
      name: 'mobileDataUse',
      desc: '',
      args: [],
    );
  }

  /// `Account activity`
  String get accountActivity {
    return Intl.message(
      'Account activity',
      name: 'accountActivity',
      desc: '',
      args: [],
    );
  }

  /// `Free up space`
  String get freeUpSpace {
    return Intl.message(
      'Free up space',
      name: 'freeUpSpace',
      desc: '',
      args: [],
    );
  }

  /// `Remove account`
  String get removeAccount {
    return Intl.message(
      'Remove account',
      name: 'removeAccount',
      desc: '',
      args: [],
    );
  }

  /// `#colapickup event just started join the challenge now!`
  String get announcementText {
    return Intl.message(
      '#colapickup event just started join the challenge now!',
      name: 'announcementText',
      desc: '',
      args: [],
    );
  }

  /// `All notifications`
  String get allNotifications {
    return Intl.message(
      'All notifications',
      name: 'allNotifications',
      desc: '',
      args: [],
    );
  }

  /// `sent you a message`
  String get sentYouMessage {
    return Intl.message(
      'sent you a message',
      name: 'sentYouMessage',
      desc: '',
      args: [],
    );
  }

  /// `wants to challenge you to `
  String get wantsToChallengeYou {
    return Intl.message(
      'wants to challenge you to ',
      name: 'wantsToChallengeYou',
      desc: '',
      args: [],
    );
  }

  /// `You won the last challenge against`
  String get youWonTheLastChallenge {
    return Intl.message(
      'You won the last challenge against',
      name: 'youWonTheLastChallenge',
      desc: '',
      args: [],
    );
  }

  /// `You won the bet on `
  String get youWonTheBetOn {
    return Intl.message(
      'You won the bet on ',
      name: 'youWonTheBetOn',
      desc: '',
      args: [],
    );
  }

  /// `is your opponent in `
  String get isYourOpponent {
    return Intl.message(
      'is your opponent in ',
      name: 'isYourOpponent',
      desc: '',
      args: [],
    );
  }

  /// `Join challenge`
  String get joinChallenge {
    return Intl.message(
      'Join challenge',
      name: 'joinChallenge',
      desc: '',
      args: [],
    );
  }

  /// `Create challenge`
  String get createChallenge {
    return Intl.message(
      'Create challenge',
      name: 'createChallenge',
      desc: '',
      args: [],
    );
  }

  /// `Go Live`
  String get goLive {
    return Intl.message(
      'Go Live',
      name: 'goLive',
      desc: '',
      args: [],
    );
  }

  /// `Create Story`
  String get createStory {
    return Intl.message(
      'Create Story',
      name: 'createStory',
      desc: '',
      args: [],
    );
  }

  /// `Add users to this chat`
  String get addUsersToThis {
    return Intl.message(
      'Add users to this chat',
      name: 'addUsersToThis',
      desc: '',
      args: [],
    );
  }

  /// `Challenge `
  String get challenge {
    return Intl.message(
      'Challenge ',
      name: 'challenge',
      desc: '',
      args: [],
    );
  }

  /// `Create team challange with `
  String get createTeamChallengeWith {
    return Intl.message(
      'Create team challange with ',
      name: 'createTeamChallengeWith',
      desc: '',
      args: [],
    );
  }

  /// `Silence chat`
  String get silenceChat {
    return Intl.message(
      'Silence chat',
      name: 'silenceChat',
      desc: '',
      args: [],
    );
  }

  /// `Block`
  String get block {
    return Intl.message(
      'Block',
      name: 'block',
      desc: '',
      args: [],
    );
  }

  /// `Report`
  String get report {
    return Intl.message(
      'Report',
      name: 'report',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get non {
    return Intl.message(
      '',
      name: 'non',
      desc: '',
      args: [],
    );
  }

  /// `Add Friend`
  String get addFriend {
    return Intl.message(
      'Add Friend',
      name: 'addFriend',
      desc: '',
      args: [],
    );
  }

  /// `Show Profile`
  String get showProfile {
    return Intl.message(
      'Show Profile',
      name: 'showProfile',
      desc: '',
      args: [],
    );
  }

  /// ` Aa`
  String get aa {
    return Intl.message(
      ' Aa',
      name: 'aa',
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
