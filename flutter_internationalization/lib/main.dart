import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future main() async {
  final FlutterI18nDelegate flutterI18nDelegate = FlutterI18nDelegate(
    translationLoader: FileTranslationLoader(
        useCountryCode: false,
        fallbackFile: 'en',
        basePath: 'assets/i18n',
        forcedLocale: const Locale('es')),
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(flutterI18nDelegate));
}

class MyApp extends StatelessWidget {
  final FlutterI18nDelegate flutterI18nDelegate;

  MyApp(this.flutterI18nDelegate);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      localizationsDelegates: [
        flutterI18nDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      builder: FlutterI18n.rootAppBuilder(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomeState createState() => MyHomeState();
}

class MyHomeState extends State<MyHomePage> {
  int clicked = 0;

  incrementCounter() {
    setState(() {
      clicked++;
    });
  }

  changeLang() async{
    final Locale? currentLang = FlutterI18n.currentLocale(context);
    final newLang = currentLang!.languageCode == 'en' ? const Locale('es') : const Locale('en');
    await FlutterI18n.refresh(context, newLang);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(FlutterI18n.translate(context, "title"))),
      body: Builder(
        builder: (BuildContext context) => StreamBuilder<bool>(
          initialData: true,
          stream: FlutterI18n.retrieveLoadedStream(context),
          builder: (BuildContext context, _) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                I18nText("label.main", translationParams: {"user": "Michel"}),
                I18nPlural("clicked.times", clicked),
                TextButton(
                    onPressed: () async {
                      incrementCounter();
                    },
                    child: Text(FlutterI18n.translate(context, "button.label.clickMe"))),
                TextButton(
                    onPressed: () async {
                      changeLang();
                    },
                    child: Text(FlutterI18n.translate(context, "button.label.language"))
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}