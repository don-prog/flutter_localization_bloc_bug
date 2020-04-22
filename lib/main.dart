import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization_bloc_bug/bloc/main_bloc.dart';
import 'package:flutter_localization_bloc_bug/bloc/main_event.dart';
import 'package:flutter_localization_bloc_bug/bloc/main_state.dart';
import 'package:flutter_localization_bloc_bug/route_generator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localizations.dart';

void main() => runApp(
      BlocProvider<MainBloc>(
        create: (_) => MainBloc()..add(ReadyEvent()),
        child: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        supportedLocales: [
          Locale('en', 'US'),
          Locale('sk', 'SK'),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          Locale usedLocale;
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              usedLocale = supportedLocale;
              break;
            }
          }
          if (usedLocale == null) usedLocale = supportedLocales.first;
          return usedLocale;
        },
        home: Scaffold(
          body: BlocListener<MainBloc, MainState>(
            listener: (context, state) {
              if (state is ReadyState) {
                print('Go to first_page');
                rootNavigatorKey.currentState
                    .pushNamedAndRemoveUntil("first_page", (r) => false);
              }
            },
            child: Navigator(
              key: rootNavigatorKey,
              initialRoute: 'splash_page',
              onGenerateRoute: RouteGenerator.generateRoute,
            ),
          ),
        ));
  }
}
