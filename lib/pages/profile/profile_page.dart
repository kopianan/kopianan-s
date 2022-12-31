import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kopianan_s/pages/auth/login_page.dart';
import 'package:kopianan_s/pages/home/home_page.dart';
import 'package:kopianan_s/routes/kopi_route.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile-page';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Page")),
      body: Center(
        child: ElevatedButton(
          child: Text("TEST"),
          onPressed: () {
            AutoRouter.of(context).push(SettingRoute());

            // AutoRouter.of(context).popAndPush(
            //   HomeRoute(),
            //   onFailure: (failure) {
            //     print(failure);
            //   },
            // );
          },
        ),
      ),
    );
  }
}
