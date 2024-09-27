import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:picture_dictionary/common/provider.dart';
import 'package:picture_dictionary/splash.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main()async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    // DevicePreview(
    // enabled: true,
    // builder: (context) => 
    MyApp(), // Wrap your app
  // ),
  );
}

class MyApp extends StatefulWidget {
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void setLocale(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TextVisibilityProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
        theme: ThemeData(
          fontFamily: 'English1'
        ),
        // supportedLocales: L10n.all,
        locale: _locale,
        // localizationsDelegates: [
        //   AppLocalizations.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate
        // ],
      ),
    );
  }
}

