import 'package:flutter/material.dart';
import 'package:kopianan_s/routes/kopi_route.dart';

import 'pages/home/home_page.dart';

class App extends StatelessWidget {
  App({super.key});
  final _appRouter = KopiRoute();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Kopianans',
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
