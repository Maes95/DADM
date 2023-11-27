import 'dart:async';

import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
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

  changeLang(String lang) async{
    setState(() {
      FlutterI18n.refresh(context, Locale(lang));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(FlutterI18n.translate(context, "title"))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            I18nText("label.main", translationParams: {"user": "Michel"}),
            I18nPlural("clicked.times", clicked),
            TextButton(
                onPressed: () async {
                  incrementCounter();
                },
                child: I18nText("button.label.clickMe")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlagButton(countryCode: FlagsCode.GB_ENG, onClick: () async {
                  changeLang("en");
                }),
                FlagButton(countryCode: FlagsCode.ES, onClick: () async {
                  changeLang("es");
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FlagButton extends StatelessWidget {
  const FlagButton({
    super.key,
    required this.countryCode,
    required this.onClick
  });

  final FlagsCode countryCode;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: (){
          onClick();
        },
        child: Flag.fromCode(
          countryCode,
          height: 50,
          width: 50,
          flagSize: FlagSize.size_1x1,
          borderRadius: 25,
        )
    );
  }
}