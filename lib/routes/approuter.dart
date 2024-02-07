import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tutorial/ui/memepage.dart';
import 'package:tutorial/ui/animalpage.dart';
import 'package:tutorial/ui/errorscreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppRouter extends StatelessWidget {
  AppRouter({Key? key}) : super(key: key);

  static const String title = 'GoRouter Routes';

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''), // English, no country code
          Locale('de', ''), //
        ],
      );

  final GoRouter _router = GoRouter(
    errorBuilder: (context, state) => ErrorScreen(error: state.error),
    routes: <GoRoute>[
      GoRoute(
        routes: <GoRoute>[
          GoRoute(
            path: 'animalpage',
            builder: (BuildContext context, GoRouterState state) =>
                const AnimalPage(title: 'Animal'),
          )
        ],
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const MemePage(title: 'Memes'),
      ),
    ],
  );
}
