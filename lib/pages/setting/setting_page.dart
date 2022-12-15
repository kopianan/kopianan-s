import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kopianan_s/routes/kopi_route.dart';

class SettingPage extends StatefulWidget {
  static const String routeName = '/setting-page';
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    print("SETTING PAGE");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Login > Home > Setting
          // Login > Setting
          // AutoRouter.of(context).replaceAll([LoginRoute(), SettingRoute()]);
        },
      ),
      appBar: AppBar(title: Text("SettingPage")),
      body: Center(
        child: ElevatedButton(
          child: Text("Next"),
          onPressed: () {
            // Splash =>Login => Home  => Setting => Profile
            // AutoRouter.of(context).push(ProfileRoute());

            // AutoRouter.of(context).pushAndPopUntil(
            //   ProfileRoute(),
            //   predicate: ModalRoute.withName(LoginRoute.name),
            // );

            AutoRouter.of(context).replaceAll([
              SplashRoute(),
              LoginRoute(),
              ProfileRoute(),
            ]);

            // AutoRouter.of(context).popUntil((route) => false);
            // AutoRouter.of(context).pushAndPopUntil(ProfileRoute(),
            //     predicate: ModalRoute.withName(HomeRoute.name));
          },
        ),
      ),
    );
  }
}
