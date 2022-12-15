import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:kopianan_s/pages/auth/login_page.dart';
import 'package:kopianan_s/pages/home/home_page.dart';
import 'package:kopianan_s/pages/profile/profile_page.dart';
import 'package:kopianan_s/pages/setting/setting_page.dart';
import 'package:kopianan_s/pages/splash/splash_page.dart';

part 'kopi_route.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true, path: SplashPage.routeName),
    AutoRoute(page: ProfilePage, path: ProfilePage.routeName),
    AutoRoute(page: HomePage, path: HomePage.routeName),
    AutoRoute(page: SettingPage, path: SettingPage.routeName),
    AutoRoute(page: LoginPage, path: LoginPage.routeName),
  ],
)
@lazySingleton
class KopiRoute extends _$KopiRoute {}
