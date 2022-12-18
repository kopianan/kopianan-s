import 'package:flutter/material.dart';
import 'package:kopianan_s/applications/auth/authentication_cubit.dart';
import 'package:kopianan_s/injection.dart';
import 'package:kopianan_s/routes/kopi_route.dart';
import 'package:kopianan_s/utils/constants.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/';
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getIt<AuthenticationCubit>().checkAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
