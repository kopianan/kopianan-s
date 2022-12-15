import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kopianan_s/pages/home/home_page.dart';
import 'package:kopianan_s/routes/kopi_route.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login-page';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    print("LOGIN PAGE");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LoginPage")),
      body: Center(
        child: ElevatedButton(
          child: Text("LOGIN"),
          onPressed: () {
            // Splash =>Login => Home  => Route => Setting => Profile

            AutoRouter.of(context).push(HomeRoute());
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
