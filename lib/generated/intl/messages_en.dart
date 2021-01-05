// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "cancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "confirmation" : MessageLookupByLibrary.simpleMessage("Confirmation"),
    "continue_it" : MessageLookupByLibrary.simpleMessage("Continue"),
    "create_list" : MessageLookupByLibrary.simpleMessage("Create a list"),
    "error_empty_value" : MessageLookupByLibrary.simpleMessage("Mandatory field"),
    "list_item" : MessageLookupByLibrary.simpleMessage("Item"),
    "list_name" : MessageLookupByLibrary.simpleMessage("Name"),
    "list_name_hint" : MessageLookupByLibrary.simpleMessage("Your list name"),
    "lists" : MessageLookupByLibrary.simpleMessage("Lists"),
    "loading" : MessageLookupByLibrary.simpleMessage("loading..."),
    "no_lists" : MessageLookupByLibrary.simpleMessage("No lists found. Use the plus button to create some"),
    "remove_list_confirmation" : MessageLookupByLibrary.simpleMessage("The list will be permanently removed"),
    "save" : MessageLookupByLibrary.simpleMessage("Save")
  };
}
