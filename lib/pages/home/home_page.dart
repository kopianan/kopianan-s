import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kopianan_s/injection.dart';
import 'package:kopianan_s/routes/kopi_route.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home-page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    print("HOME PAGE");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        actions: [IconButton(onPressed: () {
          getIt<KopiRoute>().push(SettingRoute()); 
        }, icon: Icon(Icons.settings))],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Login > Home
          // Login > Setting
          // AutoRouter.of(context).replaceAll([LoginRoute(), SettingRoute()]);
        },
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("NEXT"),
          onPressed: () {
            //Login => Home  => Setting => Profile
            //Login => Setting => Profile
            AutoRouter.of(context).push(SettingRoute());
            // AutoRouter.of(context).popAndPush(
            //   SettingRoute(),
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
