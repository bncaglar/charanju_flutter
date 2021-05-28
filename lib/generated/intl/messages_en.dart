// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "confirmationDoesNotMatch":
            MessageLookupByLibrary.simpleMessage("Confirmation does not match"),
        "continueText": MessageLookupByLibrary.simpleMessage("continue"),
        "createYourProfile":
            MessageLookupByLibrary.simpleMessage("Create your profile"),
        "doYouHaveAccount":
            MessageLookupByLibrary.simpleMessage("Do not have an account? "),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot password?"),
        "hello": MessageLookupByLibrary.simpleMessage("hello"),
        "invalidEmailAddress":
            MessageLookupByLibrary.simpleMessage("Invalid Email Address"),
        "or": MessageLookupByLibrary.simpleMessage("OR"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordMinimumLength": MessageLookupByLibrary.simpleMessage(
            "Password must have a minimum length of 6"),
        "passwordOneNumber": MessageLookupByLibrary.simpleMessage(
            "Password must have one number"),
        "passwordOneSpecialCharacter": MessageLookupByLibrary.simpleMessage(
            "Password must have one special character"),
        "passwordOneUppercase": MessageLookupByLibrary.simpleMessage(
            "Password must have one uppercase letter"),
        "readySetChallenge":
            MessageLookupByLibrary.simpleMessage("ready, set, challenge"),
        "rememberMe": MessageLookupByLibrary.simpleMessage("Remember Me"),
        "required": MessageLookupByLibrary.simpleMessage("Required"),
        "signIn": MessageLookupByLibrary.simpleMessage("sign in"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign up"),
        "weWillUseThisToSignYou": MessageLookupByLibrary.simpleMessage(
            "We’ll use this to sign you in or create an account if you don’t have one yet")
      };
}
