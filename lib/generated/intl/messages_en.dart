// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(gender) =>
      "Log in ${Intl.gender(gender, female: 'madam', male: 'sir', other: 'human')}";

  static String m1(value) => "${value}";

  static String m2(value) =>
      "${Intl.plural(value, one: '${value} comment', other: '${value} comments')}";

  static String m3(value) => "${value}";

  static String m4(nameOfTheApp) => "Log into your ${nameOfTheApp} account";

  static String m5(videoCount) =>
      "Create a profile, follow other accounts, make your own ${Intl.plural(videoCount, zero: 'no videos', one: 'video', other: 'videos')}, and more.";

  static String m6(nameOfTheApp) => "Sign up for ${nameOfTheApp}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "LogIn": m0,
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Already have an account?",
    ),
    "appleButton": MessageLookupByLibrary.simpleMessage("Continue with Apple"),
    "commentCount": m1,
    "commentTitle": m2,
    "emailPasswordButton": MessageLookupByLibrary.simpleMessage(
      "Use email & password",
    ),
    "likeCount": m3,
    "loginTitle": m4,
    "signUpSubtitle": m5,
    "signUpTitle": m6,
  };
}
