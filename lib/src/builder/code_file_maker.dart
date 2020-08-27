part of './builder.dart';

String _makeClassCodeString(
    String className, String supportedLocaleCode, String getterCode) {
  return '''
// DO NOT EDIT. This is code generated via package:intl_manager

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

// ignore_for_file: prefer_expression_function_bodies, prefer_final_locals, prefer_final_in_for_each, prefer_expression_function_bodies, lines_longer_than_80_chars
class $className {
$supportedLocaleCode
$getterCode}
''';
}

String _makeGetterCode(String message, String key) {
  message = _filterMessage(message);
  key = _filterKey(key);
  Tuple2<String, String> getterParamsInfo = _genGetterParams(message);
  return '''
  String ${() {
    if (getterParamsInfo.item1.isEmpty) {
      return 'get $key => Intl.message(\'${getterParamsInfo.item2}\', name: \'$key\');\n';
    } else {
      return '$key(${getterParamsInfo.item1}) => Intl.message(\'${getterParamsInfo.item2}\', name: \'$key\', args: [${getterParamsInfo.item1}]);\n';
    }
  }()}''';
}

Tuple2<String, String> _genGetterParams(String name) {
  var packedArgs = StringBuffer();
  String regexPrintfArg = r'{[a-zA-Z0-9]*}';
  RegExp regExp = new RegExp(regexPrintfArg);
  var argPosCounter = 0;
  var result = regExp.firstMatch(name);
  while (result != null) {
    var argName = 'strArg$argPosCounter';
    ++argPosCounter;
    name = name.replaceRange(result.start, result.end, '\$$argName');
    packedArgs.write('$argName');
    result = regExp.firstMatch(name);
    if (result != null) {
      packedArgs.write(', ');
    }
  }
  final res = Tuple2(packedArgs.toString(), name);
  return res;
}

void main() {
  _genGetterParams('');
}

String _makeSupportedLocaleCode(List<I18nEntity> supportedLocale) {
  String _supportedLanguageCode = '';
  int size = supportedLocale.length;
  for (int i = 0; i < size; i++) {
    var l = supportedLocale[i].locale;
    _supportedLanguageCode += "'${l.languageCode}',";
  }
  if (_supportedLanguageCode.endsWith(',')) {
    _supportedLanguageCode =
        _supportedLanguageCode.substring(0, _supportedLanguageCode.length - 1);
  }
  //
  String _supportedLocaleMap = '';
  for (int i = 0; i < size; i++) {
    var l = supportedLocale[i].locale;
    _supportedLocaleMap += "['${l.languageCode}','${l.countryCode ?? ''}'],";
  }
  if (_supportedLocaleMap.endsWith(',')) {
    _supportedLocaleMap =
        _supportedLocaleMap.substring(0, _supportedLocaleMap.length - 1);
  }
  return '''
  static const List<String> _supportedLanguageCode = [${_supportedLanguageCode ?? ''}];
  static const List<List<String>> _supportedLocaleMap = [${_supportedLocaleMap ?? ''}];
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
  }\n''';
}

String _filterMessage(String msg) {
  msg = msg.replaceAll('\n', '\\n');
  msg = msg.replaceAll('\r', '\\r');
  msg = msg.replaceAll('\t', '\\r');
  msg = msg.replaceAll("'", "\\'");
  return msg;
}

String _filterKey(String key) {
  if (key == null) {
    return '';
  }
  try {
    var numStart = int.parse((key[0]));
    key = key.replaceRange(0, 1, mapNumToString(numStart));
  } catch (e) {
    // ignore
  }
  print("camel caramel ${ReCase(key.trim()).camelCase}");
  return ReCase(key.trim()).camelCase;
}

bool makeDefinesDartCodeFile(File outFile, String className,
    Map<String, dynamic> arbJson, List<I18nEntity> supportedLocale) {
  List<String> getters = new List();
  arbJson.forEach((key, value) {
    if (key.startsWith('@')) {
      return;
    }
    getters.add(_makeGetterCode(value, key));
  });
  if (!outFile.existsSync()) {
    outFile.createSync();
  }
  String supportedLocaleCode = _makeSupportedLocaleCode(supportedLocale);
  String contentStr =
      _makeClassCodeString(className, supportedLocaleCode, getters.join());
  outFile.writeAsStringSync(contentStr);
  return true;
}

String mapNumToString(int num) {
  switch (num) {
    case 0:
      return "zero";
    case 1:
      return "one";
    case 2:
      return "two";
    case 3:
      return "three";
    case 4:
      return "four";
    case 5:
      return "five";
    case 6:
      return "seven";
    case 8:
      return "eight";
    default:
      return "nine";
  }
}
