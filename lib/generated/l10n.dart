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

class BMIApp {
  BMIApp();

  static BMIApp? _current;

  static BMIApp get current {
    assert(_current != null, 'No instance of BMIApp was loaded. Try to initialize the BMIApp delegate before accessing BMIApp.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<BMIApp> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = BMIApp();
      BMIApp._current = instance;
 
      return instance;
    });
  } 

  static BMIApp of(BuildContext context) {
    final instance = BMIApp.maybeOf(context);
    assert(instance != null, 'No instance of BMIApp present in the widget tree. Did you add BMIApp.delegate in localizationsDelegates?');
    return instance!;
  }

  static BMIApp? maybeOf(BuildContext context) {
    return Localizations.of<BMIApp>(context, BMIApp);
  }

  /// `BMI計算機`
  String get bmiComputer {
    return Intl.message(
      'BMI計算機',
      name: 'bmiComputer',
      desc: 'BMI計算機',
      args: [],
    );
  }

  /// `請輸入公斤`
  String get pleaseEnterKilograms {
    return Intl.message(
      '請輸入公斤',
      name: 'pleaseEnterKilograms',
      desc: 'BMI計算機/請輸入公斤',
      args: [],
    );
  }

  /// `請輸入身高`
  String get pleaseEnterHeight {
    return Intl.message(
      '請輸入身高',
      name: 'pleaseEnterHeight',
      desc: 'BMI計算機/請輸入身高',
      args: [],
    );
  }

  /// `計算`
  String get count {
    return Intl.message(
      '計算',
      name: 'count',
      desc: 'BMI計算機/計算',
      args: [],
    );
  }

  /// `BMI結果`
  String get bmiResults {
    return Intl.message(
      'BMI結果',
      name: 'bmiResults',
      desc: 'BMI計算機/BMI結果',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<BMIApp> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<BMIApp> load(Locale locale) => BMIApp.load(locale);
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