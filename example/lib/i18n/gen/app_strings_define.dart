// DO NOT EDIT. This is code generated via package:intl_manager

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

// ignore_for_file: prefer_expression_function_bodies, prefer_final_locals, prefer_final_in_for_each, prefer_expression_function_bodies, lines_longer_than_80_chars
class AppStringsDefine {
  static const List<String> _supportedLanguageCode = ['zh','en'];
  static const List<List<String>> _supportedLocaleMap = [['zh',''],['en','']];

  static List<String> getSupportedLanguageCodes(){
    return _supportedLanguageCode;
  }

  static List<Locale> createSupportedLocale(bool appendCountryCode){
    List<Locale> result = [];
    for (List<String> c in _supportedLocaleMap) {
      result.add(Locale(c[0], appendCountryCode ? c[1] : ''));
    }
    return result;
  }

  static String get exampleString => Intl.message('Hello World', name: 'exampleString');
}
