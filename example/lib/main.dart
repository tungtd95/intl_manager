import 'package:flutter/material.dart';
import 'i18n/app_strings.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Locale defLocale = Locale('vi','VN');
    return MaterialApp(
      localizationsDelegates: [
        const AppStringsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        print("locale change ${locale.languageCode}");
        for(var supportedLocal in supportedLocales) {
          if(supportedLocal.languageCode == locale.languageCode) {
            print("SUPPORTED");
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
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  _MyHomePageState();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var scaffold =  Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.of(context).merchantWalletLabelTransactionSuccess),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppStrings.of(context).merchantWalletMsgWalletMaintenanceAt('123', '23123'),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              onPressed: (){
                //change locale
                
              },
              child: Text("Change locale"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: AppStrings.of(context).merchantWalletLabelTransactionSuccess,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
    return scaffold;
  }
}
