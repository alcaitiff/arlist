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

  /// `Rename list`
  String get rename_list {
    return Intl.message(
      'Rename list',
      name: 'rename_list',
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

  /// `Copy`
  String get copy {
    return Intl.message(
      'Copy',
      name: 'copy',
      desc: '',
      args: [],
    );
  }

  /// `copy`
  String get copy_sufix {
    return Intl.message(
      'copy',
      name: 'copy_sufix',
      desc: '',
      args: [],
    );
  }

  /// `Rename`
  String get rename {
    return Intl.message(
      'Rename',
      name: 'rename',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get remove {
    return Intl.message(
      'Remove',
      name: 'remove',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get error {
    return Intl.message(
      'Something went wrong',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Add items`
  String get add_items {
    return Intl.message(
      'Add items',
      name: 'add_items',
      desc: '',
      args: [],
    );
  }

  /// `items`
  String get left_items {
    return Intl.message(
      'items',
      name: 'left_items',
      desc: '',
      args: [],
    );
  }

  /// `A...Z`
  String get asc {
    return Intl.message(
      'A...Z',
      name: 'asc',
      desc: '',
      args: [],
    );
  }

  /// `Z...A`
  String get desc {
    return Intl.message(
      'Z...A',
      name: 'desc',
      desc: '',
      args: [],
    );
  }

  /// `Filter the list or add a new`
  String get item_name_hint {
    return Intl.message(
      'Filter the list or add a new',
      name: 'item_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Filter the list`
  String get filter_hint {
    return Intl.message(
      'Filter the list',
      name: 'filter_hint',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `item`
  String get item_name {
    return Intl.message(
      'item',
      name: 'item_name',
      desc: '',
      args: [],
    );
  }

  /// `The item will be permanently removed`
  String get remove_item_confirmation {
    return Intl.message(
      'The item will be permanently removed',
      name: 'remove_item_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `category`
  String get category {
    return Intl.message(
      'category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Filter the list os add a new category`
  String get category_name_hint {
    return Intl.message(
      'Filter the list os add a new category',
      name: 'category_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `category name`
  String get category_name {
    return Intl.message(
      'category name',
      name: 'category_name',
      desc: '',
      args: [],
    );
  }

  /// `Change to`
  String get select_category {
    return Intl.message(
      'Change to',
      name: 'select_category',
      desc: '',
      args: [],
    );
  }

  /// `categories`
  String get left_categories {
    return Intl.message(
      'categories',
      name: 'left_categories',
      desc: '',
      args: [],
    );
  }

  /// `add`
  String get add {
    return Intl.message(
      'add',
      name: 'add',
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
      Locale.fromSubtags(languageCode: 'pt'),
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
