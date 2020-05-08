// DO NOT EDIT. This is code generated via package:intl_manager

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

// ignore_for_file: prefer_expression_function_bodies, prefer_final_locals, prefer_final_in_for_each, prefer_expression_function_bodies, lines_longer_than_80_chars
class AppStringsDefine {
  static const List<String> _supportedLanguageCode = ['vi','en'];
  static const List<List<String>> _supportedLocaleMap = [['vi',''],['en','']];
  // ahihi
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

  String merchantWalletMsgWalletMaintenanceAt(strArg0, strArg1) => Intl.message('Hệ thống ví được bảo trì vào $strArg0 ngày $strArg1', name: 'merchantWalletMsgWalletMaintenanceAt', args: [strArg0, strArg1]);
  String get merchantWalletLabelTransactionSuccess => Intl.message('Giao dịch thành công', name: 'merchantWalletLabelTransactionSuccess');
}
