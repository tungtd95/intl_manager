# intl_manager
A tool allows to convert a crowdin translation file (in form of xml) to dart class which support in creation of `LocalizationDelegate`.

## Add dev dependency

```
dev_dependencies:
  intl_manager: version
```

##Build script
###Build command
with options being used directly
```
flutter packages pub run intl_manager:build --scan-dir=xx --out-dir=yy --gen-class=zz
```
or we can define a config file

`intl_manager.json`

```json
{
  "scan-dir": "assets/i18n",
  "out-dir": "lib/i18n/gen",
  "gen-class": "AppStringsDefine",
  "dev-locale": "zh"
}
```
and then run
```
flutter packages pub run intl_manager:build
```

####Build options
```
--scan-dir      Directory of crowdin `xml` files. Must be naming with strings-xx.xml format. Where `xx` is a language code.

--out-dir       Output dir for `.dart` and `.arb` file

--gen-class     A class name of a generated dart file which will be directly used for the `LocalizationDelegate`.

--file-name     A name of a generated dart file which will be directly used for the `LocalizationDelegate`.
                (defaults to "strings_define.dart")ra Tên của file dart 

--dev-locale    Define which locale content should be used to generate a default dart class
```

## Step to integrate crowdin string
1. Create and define the content for the json config 'intl_manager.json'
2. Fetch crowdin string and run the `intl_manager` build script by running the following bash script
```bash
curl --location --request GET 'https://api.crowdin.com/api/project/oneid-merchant/export-file?key=<API_KEY>' -o crowdin/<some_name_1>.xml
# We can fetch multiple crowdin files and merge them. 
curl --location --request GET 'https://api.crowdin.com/api/project/oneid-merchant/export-file?key=<API_KEY>' -o crowdin/<some_name_2>.xml
diff -DVERSION1 crowdin/<some_name_1>.xml crowdin/<some_name_2>.xml > crowdin/strings-vi-raw.xml
grep -v '^#if' crowdin/strings-vi-raw.xml | grep -v '^#endif' | grep -v '^#else'> crowdin/strings-vi.xml
rm crowdin/strings-vi-raw.xml 
rm crowdin/<some_name_1>.xml 
rm crowdin/<some_name_2>.xml
flutter packages pub run intl_manager:build
exit 0
```
The above script is used to generate the localization code for `vi` locale only. If we need to support more than 1 locale, simply duplicate the bash script line which being used for crowdin fetching + xml file generation and change the language code.

3. Defined a new dart file to use the generated class in the previous step. The name of the generated class is defined by `--gen-class` option.
For example, if a generated class name is `AppStringDefine` then we will define the following class:
```dart
///this delegate need register in you main.dart file[main]
class AppStringsDelegate extends LocalizationsDelegate<AppStrings> {
  const AppStringsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppStrings.getSupportedLanguageCodes().contains(locale.languageCode);
  }

  @override
  Future<AppStrings> load(Locale locale) {
    return AppStrings.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppStrings> old) {
    return false;
  }
}

///project api for i18n strings, extends from 'intl_manager' generated strings define
class AppStrings extends AppStringsDefine {
  static Future<AppStrings> load(Locale locale) {
    final String name = locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppStrings();
    });
  }

  static AppStrings of(BuildContext context) {
    return Localizations.of<AppStrings>(context, AppStrings);
  }

  //wrap AppStringsDefine method
  static List<String> getSupportedLanguageCodes() {
    return AppStringsDefine.getSupportedLanguageCodes();
  }

  //wrap AppStringsDefine method
  static List<Locale> createSupportedLocale(bool appendCountryCode) {
    return AppStringsDefine.createSupportedLocale(appendCountryCode);
  }
}
```

4. Modify app's `MaterialApp` as the following:
```dart
Locale defLocale = Locale('vi','VN');
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        const AppStringsDelegate(),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if(locale == null) return null;
        for(var supportedLocal in supportedLocales) {
          if(supportedLocal.languageCode == locale.languageCode) {
            AppStrings.load(supportedLocal);
            return supportedLocal;
          }
        }
        return defLocale;
      },
      supportedLocales:  AppStrings.createSupportedLocale(false),
      onGenerateTitle: (BuildContext context) => AppStrings.of(context).merchantWalletLabelTransactionSuccess,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
```

After all above step, we can access i18n string by calling `AppStrings.of(context).<stringName>`

There is an isssue with iOS when changing language. The issue is fixed from Flutter SDK 1.17.5: https://github.com/flutter/flutter/issues/39032