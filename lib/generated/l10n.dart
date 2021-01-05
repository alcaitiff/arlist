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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Lists`
  String get lists {
    return Intl.message(
      'Lists',
      name: 'lists',
      desc: '',
      args: [],
    );
  }

  /// `No lists found. Use the plus button to create some`
  String get no_lists {
    return Intl.message(
      'No lists found. Use the plus button to create some',
      name: 'no_lists',
      desc: '',
      args: [],
    );
  }

  /// `loading...`
  String get loading {
    return Intl.message(
      'loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Create a list`
  String get create_list {
    return Intl.message(
      'Create a list',
      name: 'create_list',
      desc: '',
      args: [],
    );
  }

  /// `Your list name`
  String get list_name_hint {
    return Intl.message(
      'Your list name',
      name: 'list_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get list_name {
    return Intl.message(
      'Name',
      name: 'list_name',
      desc: '',
      args: [],
    );
  }

  /// `Item`
  String get list_item {
    return Intl.message(
      'Item',
      name: 'list_item',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation`
  String get confirmation {
    return Intl.message(
      'Confirmation',
      name: 'confirmation',
      desc: '',
      args: [],
    );
  }

  /// `The list will be permanently removed`
  String get remove_list_confirmation {
    return Intl.message(
      'The list will be permanently removed',
      name: 'remove_list_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_it {
    return Intl.message(
      'Continue',
      name: 'continue_it',
      desc: '',
      args: [],
    );
  }

  /// `Mandatory field`
  String get error_empty_value {
    return Intl.message(
      'Mandatory field',
      name: 'error_empty_value',
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
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}